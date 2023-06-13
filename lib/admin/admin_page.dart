import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widgets/store_form.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Store"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: const[
                StoreFormWidget(),
              ],
            ),
          ),
        ),
      )
    );
  }
}
