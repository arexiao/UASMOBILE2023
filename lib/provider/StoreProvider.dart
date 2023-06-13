// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:progress1/models/Store.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';

// class StoreProvider with ChangeNotifier {
//   List<Store> _stores = [];

//   List<Store> get stores {
//     return [..._stores];
//   }

//   Future<void> fetchStoresFromFirestore() async {
//     try {
//       final querySnapshot = await FirebaseFirestore.instance
//           .collection('stores')
//           .where('status', isEqualTo: true)
//           .get();

//       final storesData = querySnapshot.docs
//           .map((doc) => Store(
//                 storeName: doc['storeName'],
//                 storeLoc: doc['storeLoc'],
//                 storeRate: doc['storeRate'],
//                 storeImg: doc['storeImage'],
//               ))
//           .toList();

//       _stores = storesData;
//       notifyListeners();
//     } catch (error) {
//       // Handle error
//       print('Error fetching stores: $error');
//     }
//   }
// }



// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/cupertino.dart';

// // import '../Store.dart';

// // class Stores extends ChangeNotifier {
// //   final Map<String, Store> _stores = {};
// //   final List<String> coba = [];
// //   final docRef = FirebaseFirestore.instance.collection('stores').withConverter(
// //         fromFirestore: Store.fromFirestore,
// //         toFirestore: (Store event, options) => event.toFirestore(),
// //       );

// //   Map<String, Store> get stores => _stores;

// //   void initData() async {
// //     final dataRef = await docRef.where('status', isEqualTo: true).get();
// //     final data = dataRef.docs;
// //     for (var docSnapshot in data) {
// //       _stores.putIfAbsent(docSnapshot.data().title, () => docSnapshot.data());
// //     }
// //     notifyListeners();
// //   }
// // }