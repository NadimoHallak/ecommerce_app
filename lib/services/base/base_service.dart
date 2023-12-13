import 'package:dio/dio.dart';

abstract class BaseServices {
  Dio dio = Dio();

  String baseUrl = "https://dummyjson.com/products";

  
}


