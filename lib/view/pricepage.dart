// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rakaya_challange/getxcontroller/controller.dart';
// import 'package:rakaya_challange/servies/totalpricerow.dart';
// import 'package:rakaya_challange/widgets/custom_appbar.dart';
// import 'package:rakaya_challange/widgets/dilveryrowprice.dart';
// import 'package:rakaya_challange/widgets/pricerowitem.dart';

// class pricepage extends StatelessWidget {
//   const pricepage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: custom_appbar('Checkout'),
//       body: SingleChildScrollView(
//         child: Container(
//           child: Column(
//             children: [
//            Center(
//              child: Container(
//               height: 100,
//               width: 100,
//               margin: EdgeInsets.symmetric(horizontal: 1),

//               child: Icon(Icons.arrow_downward),
//               decoration: BoxDecoration(
//                  color: Colors.red,
//                  borderRadius: BorderRadius.circular(360)

//               ),
//              ),
//            ),
//            SizedBox(height: 15,),
//            GetBuilder<Controller>(
//             init: Controller(),
//              builder: (co) {

//                return ListView.builder(
//                       physics: NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount:co.cartBox.getAt[] ,
//                       itemBuilder: (context, index) {
//                         final item = cartController.cartItems[index];
//                         return pricerowitem(
//                           name: item.name,
//                           quantity: item.quantity,
//                           price: item.price,
//                         );
//                       },
//                     );
//              }
//            ),
//            Divider(
//             indent: 20,
//             endIndent: 20,
//            ),
//            dilveryrowprice(name: 'upstel', price: 18),
//            totalprice_calculator(),
//            Container(
//             margin: EdgeInsets.only(top: 10),
//           height: MediaQuery.of(context).size.height * 50/100,
//         width:MediaQuery.of(context).size.width * 100/100,
//         color: Colors.blue[900],
//         alignment: Alignment.center,
//         child: Text('😄\nthanke you',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white),),
//            ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:rakaya_challange/getxcontroller/controller.dart';
// //  // Update with actual import path
// // import 'package:rakaya_challange/widgets/pricerowitem.dart'; // Update with actual import path

// // class PricePage extends StatelessWidget {
// //   const PricePage({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     // Accessing the controller

// //     final cartController = Get.find<Controller>();

// //     return Scaffold(
// //       appBar: AppBar(title: Text('Checkout')),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             Obx(() => ListView.builder(
// //                   physics: NeverScrollableScrollPhysics(),
// //                   shrinkWrap: true,
// //                   itemCount: cartController.cartItems.length,
// //                   itemBuilder: (context, index) {
// //                     final item = cartController.cartItems[index];
// //                     return PricerowItem(
// //                       name: item.name,
// //                       quantity: item.quantity,
// //                       price: item.price,
// //                     );
// //                   },
// //                 )),
// //             Text('Total Price: ${cartController.totalPrice}'),
// //             // Additional widgets as needed
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rakaya_challange/getxcontroller/controller.dart';
import 'package:rakaya_challange/widgets/custom_appbar.dart';
import 'package:rakaya_challange/widgets/dilveryrowprice.dart';
import 'package:rakaya_challange/widgets/pricerowitem.dart';
import 'package:rakaya_challange/servies/totalpricerow.dart';

class PricePage extends StatelessWidget {
  const PricePage({super.key});

  @override
  Widget build(BuildContext context) {
    double total = 0;
    Controller con = Get.put(Controller());

    for (int i = 0; i < con.cart.length; i++) {
      total = total + (con.cart[i].price * con.cart[i].quantity);
    }

    // Ensure the Controller is initialized where appropriate, for example, in your main.dart or prior to this widget being built

    return Scaffold(
      appBar: CustomAppBar(title: '',),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.symmetric(horizontal: 1),
                child: Icon(Icons.arrow_downward),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(360)),
              ),
            ),
            SizedBox(height: 15),
            GetBuilder<Controller>(
              init: Controller(),
              builder: (controller) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      controller.cart.length, // Use the length of the cart list
                  itemBuilder: (context, index) {
                    final item = controller.cart[index];

                    return pricerowitem(
                      name: item.name,
                      quantity: item.quantity,
                      price: item.price,
                    );
                  },
                );
              },
            ),
            Divider(indent: 20, endIndent: 20),
            dilveryrowprice(name: 'upstel', price: 18),
            totalprice_calculator(price: total+18),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue[900],
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => print(total),
                child: Text(
                  '😄\n'+'6'.tr,
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
