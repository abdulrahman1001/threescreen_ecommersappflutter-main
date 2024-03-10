import 'package:flutter/material.dart';

class totalprice_calculator extends StatelessWidget {
  const totalprice_calculator({super.key, required this.price});
  final double price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total:',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Text(
            '\$${price}',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.orange[800]),
          )
        ],
      ),
    );
  }
}
