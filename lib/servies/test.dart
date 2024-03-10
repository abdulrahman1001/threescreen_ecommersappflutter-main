import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rakaya_challange/models/itemmodel.dart';
import 'package:rakaya_challange/servies/getapi.dart';
import 'package:rakaya_challange/view/vieworderpage.dart';
import 'package:rakaya_challange/widgets/imge_furstore.dart';

class build_item_infromtion extends StatefulWidget {
  const build_item_infromtion({super.key});

  @override
  State<build_item_infromtion> createState() => _build_item_infromtionState();
}

class _build_item_infromtionState extends State<build_item_infromtion> {
  final Future<List<itemmodel>> _newsArticles = ApiEvent(dio: Dio()).getitem();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<itemmodel>>(
        future: _newsArticles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
                child: Text('Error fetching news: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  var article = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                         Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewOrderPage(img: article.img,title: article.title,price: article.price,),
          ),
        );
                    },
                    child: imge_furstore(
                      img: article.img,
                      title: article.title,
                      price: article.price,
                    ),
                  );
                });
          } else {
            return Center(child: Text('No news found'));
          }
        },
      ),
    );
  }
}
