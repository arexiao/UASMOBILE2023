import 'package:flutter/material.dart';
class DrawerWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Drawer(
            child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                    // _drawerHeader(),
                    _drawerItem(
                        icon: Icons.star,
                        text: 'Favorite',
                        onTap: () => print('Tap Favorite')),
                    // Divider(height: 25, thickness: 1),
                    // Padding(
                    //     padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
                    //     child: Text("Labels",y
                    //     style: TextStyle(
                    //        fontSize: 16,
                    //        color: Colors.black54,
                    //     )),
                    // ),
                    _drawerItem(
                        icon: Icons.settings,
                        text: 'Settings',
                        onTap: () => print('Tap Settings')),
                    _drawerItem(
                        icon: Icons.info,
                        text: 'About',
                        onTap: () => print('Tap Recent menu')),
                    _drawerItem(
                        icon: Icons.question_mark,
                        text: 'Help',
                        onTap: () => print('Tap Trash menu')),
                    Divider(height: 25, thickness: 1),
                    Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
                        child: Text("© Mall Navigation",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                          color: Colors.black54,
                        )),
                    ),
                 ],
            ),
       );
   }
}
// Widget _drawerHeader() {
//     return UserAccountsDrawerHeader(
//          currentAccountPicture: ClipOval(
//              child: Image(
//                  image: AssetImage('image/profile.jpg'),
//                  fit: BoxFit.cover),
//              ),
//              accountName: Text('SUNG HANBIN'),
//         accountEmail: Text('boysplanet01@naver.com'),
//     );
// }

Widget _drawerItem(
    {IconData? icon, String? text, GestureTapCallback? onTap}) {
       return ListTile(
              title: Row(
              children: <Widget>[
                  Icon(icon),
                  Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: Text(
                            text!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                            ),
                      ),
                 ),
             ],
          ),
          onTap: onTap,
    );
}
