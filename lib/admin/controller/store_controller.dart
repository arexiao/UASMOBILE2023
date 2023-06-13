import 'package:get/get.dart';

import '../models/store_model.dart';
import '../repository/store_repository.dart';

class StoreKontrol extends GetxController{
  static StoreKontrol get instance => Get.find();

  final _storeRepo = Get.put(StoreRepository());

  Future<List<StoreModel>> getAllStore() async{
    return await _storeRepo.allStore();
  }

}