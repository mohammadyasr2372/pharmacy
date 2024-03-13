// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:login_signup/service/base_service.dart';
import 'package:login_signup/config/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceBasket extends BaseService {
  late num basket_id;
  createBasket() async {
    String? token = config.get<SharedPreferences>().getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    late Response response;
    try {
      response = await dio.post('$baseUrl/api/bask/');
    } catch (e) {
      return false;
    }

    if (response.statusCode == 201) {
      print(response.data['data']['id']);
      basket_id = response.data['data']['id'];
      config
          .get<SharedPreferences>()
          .setInt('Basket id', response.data['data']['id']);
      print(config.get<SharedPreferences>().getInt('Basket id'));
      return true;
    } else {
      return false;
    }
  }

  createStatusBasket() async {
    String? token = config.get<SharedPreferences>().getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    num basketId = config.get<SharedPreferences>().getInt('Basket id')!;
    late Response response;
    try {
      response =
          await dio.post('$baseUrl/api/Order_status/?basket_id=$basketId');
    } catch (e) {
      return false;
      // print(e.toString());
      // print('found');
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

  showBasket() async {
    String? token = config.get<SharedPreferences>().getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';

    late Response response;
    try {
      response = await dio.get('$baseUrl/api/bask/show');
    } catch (e) {
      return false;
      // print(e.toString());
      // print('found');
    }
    if ((response.data['data'] == null)) {
      return false;
    }
    if (response.statusCode == 200) {
      print(response.data['data']);
      return response.data['data'];
    } else {
      return false;
    }
  }

  showPrice({required num id_bask}) async {
    String? token = config.get<SharedPreferences>().getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';

    late Response response;
    try {
      response = await dio.get('$baseUrl/api/bask/total/$id_bask');
    } catch (e) {
      return '0';
      // print(e.toString());
      // print('found');
    }
    // if ((response.data) {
    //   return 0;
    // }
    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    } else {
      return '0';
    }
  }
}
