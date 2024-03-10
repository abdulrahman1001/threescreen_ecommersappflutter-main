import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
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
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      home: Furntiure_page()
    );
  }
}
