import 'package:cloud_firestore/cloud_firestore.dart';

class StoreModel {
  final String? id;
  final String storeCat;
  final String storeName;
  final String storeLoc;
  final double storeRate;
  final String storeImage;

  const StoreModel(
    {
      this.id,
      required this.storeCat,
      required this.storeName,
      required this.storeLoc,
      required this.storeRate,
      required this.storeImage,

    }
  );

  toJson(){
    return {
      "storeCat" : storeCat,
      "storeName" : storeName,
      "storeLoc" : storeLoc,
      "storeRate" : storeRate,
      "storeImage" : storeImage,
    };
  }

  factory StoreModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return StoreModel(
      id: document.id,
      storeCat : data["storeCat"],
      storeName : data["storeName"],
      storeLoc : data["storeLoc"],
      storeRate : data["storeRate"],
      storeImage : data["storeImage"],
    );
  }
}