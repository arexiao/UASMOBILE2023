import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/store_model.dart';


class StoreRepository extends GetxController {
  static StoreRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createStore(StoreModel store) async {
    await _db.collection("store").add(store.toJson()).
    whenComplete(
      () => Get.snackbar("Succes", "Store has been added!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.1),
      colorText: Colors.green),
      )
      .catchError((error, stackTrace){
        Get.snackbar("Error", "Something went wrong. Try Again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
        print(error.toString());
      }
      );
  }


Future<StoreModel> getStoreDetails(String storeName) async {
  final snapshot = await _db.collection("store").where("storeName", isEqualTo: storeName).get();
  final storeData = snapshot.docs.map((e) => StoreModel.fromSnapshot(e)).single;
  return storeData;
}

Future<List<StoreModel>> allStore() async {
  final snapshot = await _db.collection("store").get();
  final storeData = snapshot.docs.map((e) => StoreModel.fromSnapshot(e)).toList();
  return storeData;
}

}