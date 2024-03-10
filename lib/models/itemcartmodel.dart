import 'package:hive/hive.dart';

part 'itemcartmodel.g.dart'; 

@HiveType(typeId: 0) // typeId is unique identifier for each Hive object
class ItemCartModel extends HiveObject {
  @HiveField(0)
   int quantity;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final double price; // Consider using a specific type for better consistency

  ItemCartModel({required this.quantity, required this.name, required this.price});
  // setterquan(int num){
  //   this.quantity += num;
  // }
  
  
}
