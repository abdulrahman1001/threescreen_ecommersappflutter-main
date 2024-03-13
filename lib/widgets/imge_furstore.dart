import 'package:flutter/material.dart';

class imge_furstore extends StatelessWidget {
  final String img;
  final String title;
  final dynamic price;
  const imge_furstore({
    super.key, required this.img, required this.title, this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.bottomLeft,
      
      height: MediaQuery.of(context).size.height * 80 / 100,
      width: MediaQuery.of(context).size.width * 20 / 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blue,
          image:  DecorationImage(
              image: NetworkImage(img),
              fit: BoxFit.fill
              )),
      child: Container( constraints: const BoxConstraints(
          // maxWidth: double.infinity,
          // maxHeight: double.infinity
      ),
      
     
      margin: EdgeInsets.only(left: 3,bottom: 15,top: 10),
        decoration: BoxDecoration(
    
        borderRadius: BorderRadius.circular(60),
        color: Colors.blue[900]
      ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('${title}  \n price:${price}',style: TextStyle(color: Colors.white),),
        )),
    );
  }
}
