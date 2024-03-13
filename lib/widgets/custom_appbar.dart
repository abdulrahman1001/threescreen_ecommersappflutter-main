import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rakaya_challange/getxcontroller/controller.dart';
import 'package:rakaya_challange/view/pricepage.dart';
import 'package:badges/badges.dart' as badges;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    Controller con = Get.put(Controller());
    
    return AppBar(
      title: Text(title),
      leading: Container(
        margin: EdgeInsets.only(left: 20),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Text(
            '⟵',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.8)),
          ),
        ),
      ),
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 22,left: 22),
            child:badges.Badge (
              badgeContent: Text('${con.cart.length}'),
            
              child: IconButton(
                  iconSize: 30,
                  
                  color: Colors.black,
                  onPressed: () {
                    Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PricePage()),
                  );
                  },
                  icon: (Icon(Icons.local_shipping_outlined))),
            )
            //  Icon(Icons.local_shipping_outlined,
            //     size: 30, color: Colors.black),
            ),
      ],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize =>
      new Size.fromHeight(kToolbarHeight); // Default AppBar height
}
