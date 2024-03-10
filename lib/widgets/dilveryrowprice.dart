import 'package:flutter/material.dart';

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
          Text(' delivey'),
          Text(name),
          
          Text('\$${price}'),
        ],
      ),
    );
  }
}
