import 'package:flutter/material.dart';
import 'package:progress1/Event.dart';
import 'package:progress1/models/Store.dart';
import '../HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DailyList extends StatefulWidget {
  const DailyList({super.key});

  @override
  State<DailyList> createState() => _DailyListState();
}

class _DailyListState extends State<DailyList> {
  TextEditingController _textEditingController = TextEditingController();
  List<DrinksList?> displayDrinkList = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getMainDrinksList().then((drinksList) {
      print(drinksList);
      setState(() {
        displayDrinkList.addAll(drinksList);
      });
    });
  }

  final CollectionReference drinksCollection =
      FirebaseFirestore.instance.collection('store');

  Future<List<DrinksList?>> getMainDrinksList() async {
    QuerySnapshot snapshot =
        await drinksCollection.where('storeCat', isEqualTo: 'food').get();

    return snapshot.docs
        .map((doc) => DrinksList.fromDocumentSnapshot(doc))
        .toList();
  }

  void updateList(String value) {
    setState(() {
      // displayDrinkList = DrinksList.where((element) =>
      // element.storeName!.toLowerCase().contains(value.toLowerCase())).toList();
      displayDrinkList = displayDrinkList
          .where((element) =>
              element!.storeName!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
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
              child: displayDrinkList.length == 0
                  ? Center(
                      child: Text(
                        "No Result Found",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: displayDrinkList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            displayDrinkList[index]!.storeName ?? "",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle:
                              Text(displayDrinkList[index]!.storeLoc ?? ""),
                          trailing: Text(
                              "${displayDrinkList[index]!.storeRate ?? ""} / 5.0"),
                          leading: Image(
                              image: NetworkImage(
                                  displayDrinkList[index]!.storeImage ?? "")),
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

class DrinksList {
  String? storeName;
  String? storeLoc;
  double? storeRate;
  String? storeImage;

  DrinksList({this.storeName, this.storeLoc, this.storeRate, this.storeImage});

  DrinksList.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    if (data != null) {
      storeName = data['storeName'];
      storeLoc = data['storeLoc'];
      storeRate = data['storeRate'];
      storeImage = data['storeImage'];
    }
  }
}
