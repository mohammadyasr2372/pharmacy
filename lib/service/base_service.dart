import 'package:dio/dio.dart';

abstract class BaseService {
  Dio dio = Dio();
  String baseUrl = 'http://127.0.0.1:8000';
  late Response response;
}
