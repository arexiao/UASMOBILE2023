// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:progress1/pages/add_product_page.dart';
// import 'package:progress1/pages/auth_page.dart';
// import 'package:progress1/pages/edit_product_page.dart';
// import 'package:progress1/providers/auth.dart';
// import 'package:progress1/providers/stores.dart';
// import 'package:provider/provider.dart';
// import 'HomePage.dart';
// import 'Drawer.dart';
// import 'Event.dart';
// import 'DetailPage.dart';
// import 'category/DrinkList.dart';
// import 'models/store.dart';
// import 'nav.dart';
// import 'category/FoodList.dart';
// import 'category/BankList.dart';
// import 'category/DailyList.dart';
// import 'category/FashionList.dart';
// import 'category/GadgetList.dart';
// import 'category/MedicineList.dart';
// import 'category/OtherList.dart';
// import 'home_page.dart';
// import 'option/auth.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (ctx) => Auth(),
//         ),
//         ChangeNotifierProxyProvider<Auth, Store>(
//           create: (context) => Stores(),
//           update: (context, auth, stores) =>
//               stores!..updateData(auth.token, auth.userId),
//         ),
//       ],
//       builder: (context, child) => Consumer<Auth>(
//         builder: (context, auth, child) => MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home: auth.isAuth
//               ? HomePage()
//               : FutureBuilder(
//                   future: auth.autoLogin(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Scaffold(
//                         body: Center(
//                           child: CircularProgressIndicator(),
//                         ),
//                       );
//                     }

//                     return LoginPage();
//                   },
//                 ),
//         ),
//       ),
//     );
//   }
// }



// // return MaterialApp(
// //       home: nav(),
// //         debugShowCheckedModeBanner: false,
// //         routes:{
// //           'homepage': (context) => HomePage(),
// //           'drawer':(context) => DrawerWidget(),
// //           'news' : (context) => Event(),
// //           'detail' : (context) => DetailPage(),
// //           'nav': (context) => nav(),
// //           'food': (context) => FoodList(),
// //           'drink': (context) => DrinkList(),
// //           'fashion': (context) => FashionList(),
// //           'daily': (context) => DailyList(),
// //           'bank': (context) => BankList(),
// //           'gadget': (context) => GadgetList(),
// //           'others': (context) => OtherList(),
// //         },  
// //     );

