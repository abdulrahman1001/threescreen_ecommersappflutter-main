import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';
import 'package:rakaya_challange/models/itemcartmodel.dart';

class Controller extends GetxController {
  var cart = <ItemCartModel>[];
  late Box<ItemCartModel> cartBox;
   Locale locale = Locale('ar');

  @override
  void onInit() {
    super.onInit();
    cartBox = Hive.box<ItemCartModel>('cartBox');
    loadCartItems(); // Load cart items from Hive box at initialization
  }

  void addCartItem(int quan, String name, double price) {
    int index = cart.indexWhere((item) => item.name == name);

    if (index != -1) {
      // Item exists, update its quantity
      cart[index].quantity += quan;
      cartBox.putAt(
          index, cart[index]); // Assuming cartBox is a Hive box for persistence
    } else {
      // Item does not exist, add a new one
      final item = ItemCartModel(name: name, price: price, quantity: quan);
      cart.add(item);
      cartBox.add(item); // Add to Hive box for persistence
    }

    update(); // This is used to update the UI, assuming GetX or a similar state management solution
  }

  void loadCartItems() {
    final items = cartBox.values.toList();
    cart.addAll(items); // Load items into the observable list
  }

  changelang() {
   
    if (locale == Locale('ar')){
         locale = Locale('en');
    Get.updateLocale(locale);
    }
   else{
        locale = Locale('ar');
    Get.updateLocale(locale);
   } 
  }
}
