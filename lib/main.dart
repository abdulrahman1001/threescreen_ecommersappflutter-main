import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rakaya_challange/getxcontroller/controller.dart';
import 'package:rakaya_challange/getxcontroller/local.dart';
import 'package:rakaya_challange/models/itemcartmodel.dart';
import 'package:rakaya_challange/view/Furniture.dart';
import 'package:rakaya_challange/view/pricepage.dart';
import 'package:rakaya_challange/view/vieworderpage.dart';
import 'package:rakaya_challange/widgets/pricerowitem.dart';

void main() async {
  await Hive.initFlutter(); // Initialize Hive
  Hive.registerAdapter(ItemCartModelAdapter()); // Register the adapter
  await Hive.openBox<ItemCartModel>('cartBox'); // Open a box
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  Controller cont = Get.put(Controller());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        
      
      locale: cont.locale,
    
      translations: mylocal(),
        debugShowCheckedModeBanner: false, home: Furntiure_page());
  }
}
