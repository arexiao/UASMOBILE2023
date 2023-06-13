import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Drawer.dart';
import 'DetailPage.dart';
import 'search.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int _selectedIndex = 0 ;
  void _onItemTapped(int index) {
    setState(() {
          _selectedIndex = index;
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 110,
                    width: double.infinity,
                    color: Colors.orange,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Welcome ! Where are you going today ?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F5F7),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    children: [
                                      Icon(Icons.search, color: Colors.grey,),
                                      SizedBox(width: 10),
                                      Text(
                                        "Search Your Destination Here",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SearchScreen()
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Category(iconC: Icon(Icons.local_dining, size: 35,), title: "Food", rute: 'food', onPressed: () {
                          Navigator.pushNamed(context, '/food');
                        },),
                        Category(iconC: Icon(Icons.coffee, size: 35,), title: "Drink", rute: 'drink', onPressed: () {
                          Navigator.pushNamed(context, '/drink');
                        },),
                        Category(iconC: Icon(Icons.checkroom, size: 35,), title: "Fashion", rute: 'fashion', onPressed: () {
                          Navigator.pushNamed(context, '/fashion');
                        },),
                        Category(iconC: Icon(Icons.local_grocery_store, size: 35,), title: "Daily", rute: 'daily', onPressed: () {
                          Navigator.pushNamed(context, '/daily');
                        },),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Category(iconC: Icon(Icons.local_atm, size: 35,), title: "Bank", rute: 'bank', onPressed: () {
                          Navigator.pushNamed(context, '/bank');
                        },),
                        Category(iconC: Icon(Icons.local_hospital, size: 35,), title: "Medicine", rute: 'med', onPressed: () {
                          Navigator.pushNamed(context, '/med');
                        },),
                        Category(iconC: Icon(Icons.phone_android, size: 35,), title: "Gadget", rute: 'gadget', onPressed: () {
                          Navigator.pushNamed(context, '/gadget');
                        },),
                        Category(iconC: Icon(Icons.category_outlined, size: 35,), title: "Others", rute: 'others', onPressed: () {
                          Navigator.pushNamed(context, '/others');
                        },),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Best Destination ✨",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            Shop(
              nameShop: "Starbucks", 
              rate: "5.0", 
              imagePath: "images/sbux.png")
          ],
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  final iconC;
  final String title;
  final String rute;
  final void Function() onPressed;
  const Category({
    Key? key,
    required this.iconC,
    required this.title, 
    required this.rute,
    required this.onPressed,
  }) 
  : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: 60,
          height: 70,
          child: Column(
            children: <Widget> [
              iconC,
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 10),
              ),
            ], 
          ), 
        ), 
      ),
    ),
    );
  }
}

class Shop extends StatelessWidget {
  final String imagePath;
  final String nameShop;
  final String rate;
  // final String rute;
  const Shop({
    Key? key,
    required this.nameShop,
    required this.rate, 
    required this.imagePath,
    // required this.rute,
  }) 
  : super(key: key);


  @override
  Widget build(BuildContext context) {
    void _detail() {
    Navigator.pushNamed(context, 'detail');
  }
    return GestureDetector(
      onTap: _detail,
      child: SizedBox(
        width: double.infinity,
        height: 240,
        child: Stack(
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 10,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Image.asset(imagePath, fit: BoxFit.cover,),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                left: 10,
                child: SizedBox(
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(nameShop,
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            SizedBox(
                              width: 5,
                            ),
                            Text(rate,
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                        ),
                        ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}

// class HomePage extends StatelessWidget{

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         bottomNavigationBar: NavBar(),
//         backgroundColor: Colors.white,
//         drawer: DrawerWidget()
//       );
       
//     }
// }

// class NavBar extends StatefulWidget {
  
//   const NavBar({super.key});

//   @override
//   State<NavBar> createState() => _NavBarState();
// }

// class _NavBarState extends State<NavBar> {
  
//   final List<Map<String, dynamic>> myList = [
//     {
//       "Name" : "Starbucks",
//       "Location" : "TP 6 Lantai 4",
//       "Open - Close" : "10.00 - 21.00",
//       "Tag" : ["Cafe", "Food", "Drink", "Wi-Fi"],
//       "Image" : "images/sbux.png"
//     },
//     {
//       "Name" : "H&M",
//       "Location" : "TP 4 Lantai 2",
//       "Open - Close" : "10.00 - 21.00",
//       "Tag" : ["Shop", "Fashion", "Wardrobe", "OOTD"],
//       "Image" : "images/hm.png"
//     },
//     {
//       "Name" : "KKV",
//       "Location" : "TP 3 Lantai 1",
//       "Open - Close" : "10.00 - 21.00",
//       "Tag" : ["Shop", "Fashion", "Food", "Beauty", "Toys", "Health"],
//       "Image" : "images/kkv.png"
//     },
//     {
//       "Name" : "Genki Sushi",
//       "Location" : "TP 4 Lantai 6",
//       "Open - Close" : "10.00 - 21.00",
//       "Tag" : ["Restaurant", "Food", "Japanese"],
//       "Image" : "images/genkisushi.png"
//     },
//     {
//       "Name" : "ACE Hardware",
//       "Location" : "TP 1 Lantai 1",
//       "Open - Close" : "10.00 - 21.00",
//       "Tag" : ["Shop", "Furniture"],
//       "Image" : "images/ace.png"
//     },
//     {
//       "Name" : "Hero",
//       "Location" : "TP 1 Lantai 1",
//       "Open - Close" : "10.00 - 21.00",
//       "Tag" : ["Shop", "Food", "Drink", "Vegetable", "Fruit", "Ice Cream", "Meat", "Daily"],
//       "Image" : "images/hero.png"
//     },
//   ];

//   int _selectedNavBar = 0;
//   void _changeSelNavBar(int index) {
//     setState(() {
//       _selectedNavBar = index;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: DrawerWidget(),
//       appBar: AppBar(
//         backgroundColor: Colors.orangeAccent,
//         title: Center(
//           child: Text("Tunjungan Plaza" , textAlign: TextAlign.center,),
//         ),
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(10),
//           child: Text(
//             DateFormat.yMMMMd().format(DateTime.now()).toString(), style: TextStyle(color: Colors.white), textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//       body: ListView(          
//           children: myList.map((data) {
//             print(data["Tag"]);
//             List hobbies = data["Tag"];
//             return Card(
//               margin: EdgeInsets.all(10),
//               color: Colors.orangeAccent,
//               child: Container(
//                 margin: EdgeInsets.all(10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [CircleAvatar(
//                         backgroundImage: AssetImage(data['Image']),
//                       ), 
//                       SizedBox(
//                         width: 20,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Name : ${data['Name']}", style: TextStyle(fontWeight: FontWeight.bold),),
//                           Text("Location : ${data['Location']}"),
//                           Text("Open - Close : ${data['Open - Close']}"),
//                         ],
//                       ),
//                       ],
//                     ),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: hobbies.map((datahobby){
//                           return Container(
//                             color: Color.fromARGB(255, 255, 255, 255),
//                             margin: EdgeInsets.symmetric(
//                               vertical: 15,
//                               horizontal: 8,
//                             ),
//                             padding: EdgeInsets.all(10),
//                             child: Text(datahobby),
//                           );
//                         }).toList()
//                         ),
//                     ),
//                     ],
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.newspaper),
//             label: 'News'
//             ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home'
//             ),
//           // BottomNavigationBarItem(
//           //   icon: Icon(Icons.person),
//           //   label: 'Profile'
//           //   ),
//         ],
//         currentIndex: 1,
//         selectedItemColor: Colors.orange,
//         unselectedItemColor: Colors.grey,
//         onTap: _changeSelNavBar,
//       ),
//     );
//   }
// }