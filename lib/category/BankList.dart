import 'package:flutter/material.dart';
import 'package:progress1/Event.dart';
import 'package:progress1/models/Store.dart';
import '../HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BankList extends StatefulWidget {
  const BankList({Key? key}) : super(key: key);

  @override
  State<BankList> createState() => _BankListState();
}

class _BankListState extends State<BankList> {
  TextEditingController _textEditingController = TextEditingController();
  List<BanksList?> displayBankList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getMainBanksList().then((banksList) {
      setState(() {
        displayBankList.addAll(banksList);
      });
    });
  }

  final CollectionReference storeCollection =
      FirebaseFirestore.instance.collection('store');

  Future<List<BanksList?>> getMainBanksList() async {
    QuerySnapshot snapshot =
        await storeCollection.where('storeCat', isEqualTo: 'bank').get();

    return snapshot.docs
        .map((doc) => BanksList.fromDocumentSnapshot(doc))
        .toList();
  }

  void updateList(String value) {
    setState(() {
      displayBankList = displayBankList
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
              child: displayBankList.length == 0
                  ? Center(
                      child: Text(
                        "No Result Found",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: displayBankList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            displayBankList[index]!.storeName ?? "",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle:
                              Text(displayBankList[index]!.storeLoc ?? ""),
                          trailing: Text(
                              "${displayBankList[index]!.storeRate ?? ""} / 5.0"),
                          leading: Image(
                              image: NetworkImage(
                                  displayBankList[index]!.storeImage ?? "")),
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

class BanksList {
  String? storeName;
  String? storeLoc;
  double? storeRate;
  String? storeImage;

  BanksList({this.storeName, this.storeLoc, this.storeRate, this.storeImage});

  BanksList.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    if (data != null) {
      storeName = data['storeName'];
      storeLoc = data['storeLoc'];
      storeRate = data['storeRate'];
      storeImage = data['storeImage'];
    }
  }
}
