import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'HomePage.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _textEditingController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<StoreList> mainStoreList = [];
  List<StoreList> displayList = [];

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    fetchStoreData();
  }

  Future<void> fetchStoreData() async {
    QuerySnapshot snapshot = await firestore.collection('store').get();
    List<StoreList> stores = [];
    snapshot.docs.forEach((doc) {
      String? storeName = doc['storeName'];
      String? storeLoc = doc['storeLoc'];
      double? storeRate = doc['storeRate'];
      String? storeImage = doc['storeImage'];

      StoreList store = StoreList(storeName, storeLoc, storeRate, storeImage);
      stores.add(store);
    });

    setState(() {
      mainStoreList = stores;
      displayList = List.from(mainStoreList);
    });
  }

  void updateList(String value) {
    setState(() {
      displayList = mainStoreList.where((element) =>
          element.storeName!.toLowerCase().contains(value.toLowerCase())).toList();
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
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.filter_list,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: displayList.length == 0
                  ? Center(
                      child: Text(
                        "No Result Found",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: displayList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            displayList[index].storeName ?? "",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(displayList[index].storeLoc ?? ""),
                          trailing:
                              Text("${displayList[index].storeRate ?? ""} / 5.0"),
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

class StoreList {
  String? storeName;
  String? storeLoc;
  double? storeRate;
  String? storeImage;

  StoreList(this.storeName, this.storeLoc, this.storeRate, this.storeImage);
}
