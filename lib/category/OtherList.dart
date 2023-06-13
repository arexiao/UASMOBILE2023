import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../HomePage.dart';
import 'package:progress1/models/Store.dart';

class OtherList extends StatefulWidget {
  const OtherList({Key? key}) : super(key: key);

  @override
  State<OtherList> createState() => _OtherListState();
}

class _OtherListState extends State<OtherList> {
  TextEditingController _textEditingController = TextEditingController();
  List<OthersList?> displayOtherList = [];

  @override
  void initState() {
    super.initState();
    getOtherList().then((otherList) {
      print(otherList);
      setState(() {
        displayOtherList.addAll(otherList);
      });
    });
  }

  final CollectionReference othersCollection =
      FirebaseFirestore.instance.collection('store');

  Future<List<OthersList?>> getOtherList() async {
    QuerySnapshot snapshot =
        await othersCollection.where('storeCat', isEqualTo: 'other').get();

    return snapshot.docs
        .map((doc) => OthersList.fromDocumentSnapshot(doc))
        .toList();
  }

  void updateList(String value) {
    setState(() {
      displayOtherList = displayOtherList
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
              child: displayOtherList.length == 0
                  ? Center(
                      child: Text(
                        "No Result Found",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: displayOtherList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            displayOtherList[index]!.storeName ?? "",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(displayOtherList[index]!.storeLoc ?? ""),
                          trailing:
                              Text("${displayOtherList[index]!.storeRate ?? ""} / 5.0"),
                          leading: Image(
                            image: NetworkImage(displayOtherList[index]!.storeImage ?? ""),
                          ),
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

class OthersList {
  String? storeName;
  String? storeLoc;
  double? storeRate;
  String? storeImage;

  OthersList({this.storeName, this.storeLoc, this.storeRate, this.storeImage});

  OthersList.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    if (data != null) {
      storeName = data['storeName'];
      storeLoc = data['storeLoc'];
      storeRate = data['storeRate'];
      storeImage = data['storeImage'];
    }
  }
}