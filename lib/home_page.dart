// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/Store.dart';
// import '../provider/auth.dart';
// import '../admin/addStoreForm.dart';



// class HomePage extends StatefulWidget {
//   static const route = "/home";

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   bool isInit = true;
//   bool isLoading = false;

//   @override
//   void didChangeDependencies() {
//     if (isInit) {
//       isLoading = true;
//       Provider.of<Store>(context, listen: false).inisialData().then((value) {
//         setState(() {
//           isLoading = false;
//         });
//       }).catchError(
//         (err) {
//           print(err);
//           showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 title: Text("Error Occured"),
//                 content: Text(err.toString()),
//                 actions: [
//                   TextButton(
//                     onPressed: () {
//                       setState(() {
//                         isLoading = false;
//                       });
//                       Navigator.pop(context);
//                     },
//                     child: Text("Okay"),
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//       );

//       isInit = false;
//     }
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final prov = Provider.of<Store>(context);
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.logout),
//           onPressed: () => Provider.of<Auth>(context, listen: false).logout(),
//         ),
//         title: Text("All Stores"),
//         actions: [
//           IconButton(
//           icon: Icon(Icons.add),
//           onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddStoreForm())),
//         ),
//         ],
//       ),
//       body: (isLoading)
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : (prov.allStore.length == 0)
//               ? Center(
//                   child: Text(
//                     "No Data",
//                     style: TextStyle(
//                       fontSize: 25,
//                     ),
//                   ),
//                 )
//               : ListView.builder(
//                   itemCount: prov.allStore.length,
//                   itemBuilder: (context, i) => StoreItem(
//                     prov.allStore[i].id,
//                     prov.allStore[i].storeName,
//                     prov.allStore[i].storeLoc,
//                     prov.allStore[i].storeRate,
//                     prov.allStore[i].storeImg,
//                     prov.allStore[i].updatedAt,
//                   ),
//                 ),
//     );
//   }
// }
