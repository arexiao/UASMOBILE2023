import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'admin_page.dart';
import 'controller/store_controller.dart';
import 'models/store_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  final controller = Get.put(StoreKontrol());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Store List"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: FutureBuilder<List<StoreModel>>(
              future: controller.getAllStore(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (c, index) {
                        return Column(
                          children: [
                            ListTile(
                              iconColor: Colors.blue,
                              tileColor: Colors.blue.withOpacity(0.1),
                              leading: Image.network(
                                  snapshot.data![index].storeImage),
                              title: Text(snapshot.data![index].storeName),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(snapshot.data![index].storeLoc),
                                  Text('${snapshot.data![index].storeRate}')
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    );
                  } else if(snapshot.hasError){
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    return const Center(
                      child: Text("Something Went Wrong")
                    );
                  }
                } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                // Return a placeholder widget or an empty container if snapshot has no data
                return Container();
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminPage()));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
