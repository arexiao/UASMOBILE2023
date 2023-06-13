import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/store_model.dart';
import '../repository/store_repository.dart';

class StoreController extends GetxController{
  static StoreController get instance => Get.find();

  final storeCat = TextEditingController();
  final storeName = TextEditingController();
  final storeLoc = TextEditingController();
  final storeRate = TextEditingController();
  final storeImage = TextEditingController();

  final storeRepo = Get.put(StoreRepository());

  Future<void> createStore(StoreModel store) async {
    await storeRepo.createStore(store);
  }
}