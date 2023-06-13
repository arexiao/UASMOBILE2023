import 'package:flutter/material.dart';
import '../HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodList extends StatefulWidget {
  const FoodList({Key? key}) : super(key: key);

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<FoodStoreList> displayFoodList = [];

  TextEditingController _textEditingController = TextEditingController();

  void getDataFromFirestore() async {
    final QuerySnapshot snapshot = await _firestore.collection('store').where('storeCat', isEqualTo: 'food').get();
    if (snapshot.docs.isNotEmpty) {
      setState(() {
        displayFoodList = snapshot.docs.map((doc) {
          return FoodStoreList(
            doc['storeName'],
            doc['storeLoc'],
            doc['storeRate'],
            doc['storeImage'],
          );
        }).toList();
      });
    }
  }


  @override
  void initState() {
    super.initState();
    getDataFromFirestore();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void updateList(String value) {
    setState(() {
      displayFoodList = displayFoodList
          .where((element) =>
              element.storeName!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        onChanged: (value) => updateList(value),
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          hintText: 'Search Here',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[300],
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: displayFoodList.length == 0
                  ? Center(
                      child: Text(
                        "No Result Found",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: displayFoodList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            displayFoodList[index].storeName ?? "",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(displayFoodList[index].storeLoc ?? ""),
                          trailing: Text(
                              "${displayFoodList[index].storeRate ?? ""} / 5.0"),
                          leading: Image(
                              image: NetworkImage(
                                  displayFoodList[index].storeImage ?? "")),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodStoreList {
  String? storeName;
  String? storeLoc;
  double? storeRate;
  String? storeImage;

  FoodStoreList(this.storeName, this.storeLoc, this.storeRate, this.storeImage);
}
