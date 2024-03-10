import 'package:flutter/material.dart';

class pricerowitem extends StatelessWidget {
  const pricerowitem({
    super.key, required this.name, required this.quantity, required this.price,
  });
  final String name;
  final int quantity;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          Text('X ${quantity}'),
          Text('\$${price}'),
        ],
      ),
    );
  }
}
