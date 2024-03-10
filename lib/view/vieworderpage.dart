import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rakaya_challange/getxcontroller/controller.dart';
import 'package:rakaya_challange/view/pricepage.dart';
import 'package:rakaya_challange/widgets/custom_appbar.dart';

class ViewOrderPage extends StatefulWidget {
  const ViewOrderPage(
      {super.key, required this.img, required this.title, this.price});
  final String img;
  final String title;
  final dynamic price;

  @override
  State<ViewOrderPage> createState() => _ViewOrderPageState();
}

class _ViewOrderPageState extends State<ViewOrderPage> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    // Calculate half of the screen height
    final screenHeight = MediaQuery.of(context).size.height;
    final halfScreenHeight = screenHeight / 2;

    return Scaffold(
      appBar: CustomAppBar(title: 'chekout'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // First half with the image
            Container(
              height: halfScreenHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Second half with the Container and text
            Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: halfScreenHeight,
                // Change this color to your preference
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(23)),
                child: Column(
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(fontSize: 30),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 200,
                          width: 400,
                          decoration: BoxDecoration(
                              color: Colors.blue[900],
                              borderRadius: BorderRadius.circular(22)),
                          child: Text('\$${widget.price}'),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(right: 30),
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.blue[900],
                              borderRadius: BorderRadius.circular(22)),
                          child: Row(
                            children: [
                              IconButton(
                                  iconSize: 18,
                                  color: Colors.white,
                                  onPressed: () {
                                    if (count == 0) {
                                      final snackBar = SnackBar(
                                        content: Text(
                                            'you cannot make num less than zero'),
                                        duration: Duration(
                                            seconds:
                                                3), // Show the SnackBar for 3 seconds
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    } else {
                                      setState(() {
                                        count--;
                                      });
                                    }
                                  },
                                  icon: Icon(Icons.arrow_back_ios)),
                              Text(
                                '${count}',
                                style: TextStyle(color: Colors.white),
                              ),
                              IconButton(
                                  iconSize: 18,
                                  color: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      count = count + 1;
                                    });
                                  },
                                  icon: Icon(Icons.arrow_forward_ios)),
                            ],
                          ),
                        )
                      ],
                    ),
                    GetBuilder<Controller>(
                        init: Controller(),
                        builder: (con) {
                          return MaterialButton(
                            onPressed: () {
                             
                              con.addCartItem(
                                  count, widget.title, widget.price);
                              print(
                                  '${con.cart[0].name} ${con.cart[0].price} ${con.cart[0].quantity}');
                                           Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PricePage(),
                              ));
                            },
                            child: Text('Add to cart'),
                            color: Colors.deepOrange[400],
                          );
                        })
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
