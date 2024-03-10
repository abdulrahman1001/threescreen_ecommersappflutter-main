class itemmodel {
  final String title;
  final String img;
  final double price;
  itemmodel({
    required this.title,
    required this.img,
    required this.price,
  });
  factory itemmodel.fromJson(Map<String, dynamic> json) {
  
 final price = json['price'] is int ? json['price'].toDouble() : json['price'];

    return itemmodel(
      title: json['title'],
      img: json["image"],
      price:  price
    );
  }
}
