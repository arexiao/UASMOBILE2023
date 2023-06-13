import 'package:flutter/material.dart';
import './AddStoreForm.dart';

class AddStoreForm extends StatefulWidget {
  @override
  _AddStoreFormState createState() => _AddStoreFormState();
}

class _AddStoreFormState extends State<AddStoreForm> {
  String _selectedCategory = '';

  List<String> _categories = [
    'Food',
    'Drink',
    'Medicine',
    'Bank',
    'Fashion',
    'Daily',
    'Gadget',
    'Others',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Toko'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih Kategori:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              onChanged: (newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                });
              },
              items: _categories.map<DropdownMenuItem<String>>((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add your code to save the store with the selected category
                // ...
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}