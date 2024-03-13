// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:login_signup/model/request/order_model.dart';
import 'package:login_signup/service/base_service.dart';
import 'package:login_signup/config/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceOrder extends BaseService {
  createOrder({required OrderModel orderModel}) async {
    String? token = config.get<SharedPreferences>().getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';

    // Dio dio = Dio();
    late Response response;
    try {
      response =
          await dio.post('$baseUrl/api/order/', data: orderModel.toJson());
    } catch (e) {
      return false;
    }
    if ((response.data['data'] == null)) {
      return false;
    }
    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  updateOrder({required String quantity}) async {
    String? token = config.get<SharedPreferences>().getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';

    // Dio dio = Dio();
    late Response response;
    try {
      response = await dio.post('$baseUrl/api/order/');
    } catch (e) {
      return false;
      // print(e.toString());
      // print('found');
    }
    if ((response.data['data'] == null)) {
      return false;
    }
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.data['token']);
      return true;
    } else {
      return false;
    }
  }
}
