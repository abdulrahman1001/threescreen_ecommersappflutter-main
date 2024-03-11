import 'package:flutter/material.dart';
import 'package:get/get.dart';

class dilveryrowprice extends StatelessWidget {
  const dilveryrowprice({
    super.key, required this.name,  required this.price,
  });
  final String name;
  
  final int price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('4'.tr),
          Text(name),
          
          Text('\$${price}'),
        ],
      ),
    );
  }
}
