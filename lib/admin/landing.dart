import 'package:flutter/material.dart';

import 'addStore.dart';
import 'admin_page.dart';

class AdminLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Landing Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminPage()),
                );
              },
              child: Text('Tambah Toko'),
            ),
            // SizedBox(height: 20.0),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => AddEventForm()),
            //     );
            //   },
            //   child: Text('Tambah Event'),
            // ),
          ],
        ),
      ),
    );
  }
}