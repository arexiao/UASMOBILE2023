import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/store_form_controller.dart';
import '../homepage.dart';
import '../models/store_model.dart';

class StoreFormWidget extends StatelessWidget{
  const StoreFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StoreController());
    final formkey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.storeCat,
              decoration: const InputDecoration(
                label: Text("Store Category"),
              ),
            ),
            TextFormField(
              controller: controller.storeName,
              decoration: const InputDecoration(
                label: Text("Store Name"),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: controller.storeLoc,
              decoration: const InputDecoration(
                label: Text("Store Location"),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: controller.storeRate,
              decoration: const InputDecoration(
                label: Text("Store Rate"),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: controller.storeImage,
              decoration: const InputDecoration(
                label: Text("Store Image"),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final store = StoreModel(
                    storeCat: controller.storeCat.text.trim(),
                    storeName: controller.storeName.text.trim(),
                    storeLoc: controller.storeLoc.text.trim(),
                    storeRate: double.parse(controller.storeRate.text.trim()),
                    storeImage: controller.storeImage.text.trim(),

                  );
                  StoreController.instance.createStore(store);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage()
                    ),
                  );
                },
                
                child: Text("Add Store".toUpperCase()),
              ),
            )
          ],
        ),
        ),
    );
  }
}