import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'option/option.dart';
import 'admin/auth_page.dart';
import 'option/auth.dart';
import 'HomePage.dart';
import 'Drawer.dart';
import 'Event.dart';
import 'DetailPage.dart';
import 'category/DrinkList.dart';
import 'firebase_options.dart';
import 'nav.dart';
import 'category/FoodList.dart';
import 'category/BankList.dart';
import 'category/DailyList.dart';
import 'category/FashionList.dart';
import 'category/GadgetList.dart';
import 'category/MedicineList.dart';
import 'category/OtherList.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (ctx) => OptionPage(),
          '/home': (ctx) => HomePage(),
          '/drawer': (ctx) => DrawerWidget(),
          '/news': (ctx) => Event(),
          '/detail': (ctx) => DetailPage(),
          '/nav': (ctx) => nav(),
          '/food': (ctx) => FoodList(),
          '/drink': (ctx) => DrinkList(),
          '/fashion': (ctx) => FashionList(),
          '/daily': (ctx) => DailyList(),
          '/bank': (ctx) => BankList(),
          '/med': (ctx) => MedicineList(),
          '/gadget': (ctx) => GadgetList(),
          '/others': (ctx) => OtherList(),
        },
      ),
    );
  }
}


// void main() async{
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
    
//   );
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget{
//   Widget build(BuildContext context){
//     return MaterialApp(
//       home: OptionPage(),
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
//           'med':(context) => MedicineList(),
//           'gadget': (context) => GadgetList(),
//           'others': (context) => OtherList(),
//         },  
//     );
//   }
   
// }

// class SplashScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Navigator.pushReplacementNamed(context, 'option');}

//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'NavUs',
//               style: TextStyle(
//                 fontSize: 30.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 16.0),
//           ],
//         ),
//       ),
//       backgroundColor: Colors.orange[400],
//     );
//   }
// }

