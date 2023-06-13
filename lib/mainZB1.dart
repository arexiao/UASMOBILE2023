// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:progress1/admin/AddStoreForm.dart';
// import 'package:progress1/admin/auth_page.dart';
// import 'package:progress1/provider/auth.dart';
// // import 'package:progress1/provider/StoreProvider.dart';
// import 'package:provider/provider.dart';
// // import 'HomePage.dart';
// import 'home_page.dart';
// import 'models/Store.dart';

// hi :DDDD
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



// return MaterialApp(
//       home: nav(),
//         debugShowCheckedModeBanner: false,
//         routes:{
//           'homepage': (context) => HomePage(),
//           'drawer':(context) => DrawerWidget(),
//           'news' : (context) => Event(),
//           'detail' : (context) => DetailPage(),
//           'nav': (context) => nav(),
//           'food': (context) => FoodList(),
//           'drink': (context) => DrinkList(),
//           'fashion': (context) => FashionList(),
//           'daily': (context) => DailyList(),
//           'bank': (context) => BankList(),
//           'gadget': (context) => GadgetList(),
//           'others': (context) => OtherList(),
//         },  
//     );

