// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Store {
//   final String id;
//   final String storeName;
//   final String storeLoc;
//   final double storeRate;
//   final String storeImg;
//   final DateTime updatedAt;

//   Store({
//     required this.id,
//     required this.storeName,
//     required this.storeLoc,
//     required this.storeRate,
//     required this.storeImg,
//     required this.updatedAt,
//   });


//   factory Store.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options) {
//     final data = snapshot.data();
//     return Store(
//       id: data?['store'],
//       storeName: data?['storeName'], 
//       storeLoc: data?['storeLoc'], 
//       storeRate: data?['storeRate'], 
//       storeImg: data?['storeImg'],
//     );
//   }

//   Map<String, dynamic> toFirestore() {
//     return {
//       'storeName' : storeName,
//       'storeLoc' : storeLoc,
//       'storeRate' : storeRate,
//       'storeImg' : storeImg
//     };
//   }
// }