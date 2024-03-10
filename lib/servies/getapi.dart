import 'package:dio/dio.dart';
import 'package:rakaya_challange/models/itemmodel.dart';

 // Ensure the file name is correctly referenced

class ApiEvent {
  final Dio dio;
  ApiEvent({required this.dio});

  Future<List<itemmodel>> getitem() async {
    try {
      Response response = await dio.get(
          'https://fakestoreapi.com/products/?sort=desc');

      if (response.statusCode == 200) {
        List<dynamic> articles = response.data;
        List<itemmodel> items = [];
        
        for (var article in articles) {
          items.add(itemmodel.fromJson(article));
        }
        
        return items;
      } else {
        throw Exception('Failed to load news');
      }
    } on DioException catch (e) {
      print(e.response?.statusCode);
      throw Exception(e.message);
    }
  }
}