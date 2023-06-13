// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../models/store.dart';

// class StoreProvider with ChangeNotifier {
//   List<Store> _stores = [];

//   List<Store> get stores {
//     return [..._stores];
//   }

//   Future<void> fetchStores() async {
//     try {
//       final snapshot = await FirebaseFirestore.instance.collection('stores').get();
//       final List<Store> loadedStores = [];

//       snapshot.docs.forEach((doc) {
//         final storeData = doc.data();
//         loadedStores.add(
//           Store(
//             storeName: storeData['storeName'],
//             storeLoc: storeData['storeLoc'],
//             storeRate: storeData['storeRate'],
//             storeImg: storeData['storeImg'],
//           ),
//         );
//       });

//       _stores = loadedStores;
//       notifyListeners();
//     } catch (error) {
//       // Handle error
//       print('Error fetching stores: $error');
//       throw error;
//     }
//   }

//   // Add more methods as needed, such as adding a new store, updating a store, etc.
// }
