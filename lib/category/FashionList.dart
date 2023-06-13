import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../HomePage.dart';

class FashionList extends StatefulWidget {
  const FashionList({Key? key});

  @override
  State<FashionList> createState() => _FashionListState();
}

class _FashionListState extends State<FashionList> {
  TextEditingController _textEditingController = TextEditingController();

  List<FashionsList> displayFashionList = [];
  List<FashionsList> mainFashionList = [];

  @override
  void initState() {
    super.initState();
    getFashionList();
  }

  void getFashionList() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('store')
        .where('storeCat', isEqualTo: 'fashion')
        .get();

    List<FashionsList> fashionList = snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return FashionsList(
        data['storeName'],
        data['storeLoc'],
        data['storeRate'],
        data['storeImage'],
      );
    }).toList();

    setState(() {
      mainFashionList = fashionList;
      displayFashionList = fashionList;
    });
  }

  void updateList(String value) {
    setState(() {
      displayFashionList = mainFashionList
          .where((element) =>
              element.medicineName!.toLowerCase().contains(value.toLowerCase()))
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
                      Navigator.pop(context);
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
              child: displayFashionList.length == 0
                  ? Center(
                      child: Text(
                        "No Result Found",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: displayFashionList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            displayFashionList[index].medicineName ?? "",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle:
                              Text(displayFashionList[index].medicineLoc ?? ""),
                          trailing: Text(
                              "${displayFashionList[index].medicineRate ?? ""} / 5.0"),
                          leading: Image(
                              image: NetworkImage(
                                  displayFashionList[index].medicineImage ?? "")),
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

class FashionsList {
  String? medicineName;
  String? medicineLoc;
  double? medicineRate;
  String? medicineImage;

  FashionsList(
      this.medicineName, this.medicineLoc, this.medicineRate, this.medicineImage);
}
