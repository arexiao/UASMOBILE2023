import 'package:flutter/material.dart';
import '../HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../home_page.dart';

class AddStoreForm extends StatefulWidget {
  @override
  _AddStoreFormState createState() => _AddStoreFormState();
}

class _AddStoreFormState extends State<AddStoreForm> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController _storeNameController = TextEditingController();
  TextEditingController _storeLocController = TextEditingController();
  TextEditingController _storeRateController = TextEditingController();
  TextEditingController _storeImageController = TextEditingController();

  void addStoreToFirestore() async {
    String storeName = _storeNameController.text;
    String storeLoc = _storeLocController.text;
    double storeRate = double.tryParse(_storeRateController.text) ?? 0.0;
    String storeImage = _storeImageController.text;

    try {
      await _firestore.collection('store').add({
        'storeName': storeName,
        'storeLoc': storeLoc,
        'storeRate': storeRate,
        'storeImage': storeImage,
      });

      // Clear the text fields
      _storeNameController.clear();
      _storeLocController.clear();
      _storeRateController.clear();
      _storeImageController.clear();

      // Show a success dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Store added successfully.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      // Show an error dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred while adding the store.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Store'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _storeNameController,
              decoration: InputDecoration(labelText: 'Store Name'),
            ),
            TextField(
              controller: _storeLocController,
              decoration: InputDecoration(labelText: 'Store Location'),
            ),
            TextField(
              controller: _storeRateController,
              decoration: InputDecoration(labelText: 'Store Rating'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _storeImageController,
              decoration: InputDecoration(labelText: 'Store Image'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => addStoreToFirestore(),
              child: Text('Add Store'),
            ),
          ],
        ),
      ),
    );
  }
}