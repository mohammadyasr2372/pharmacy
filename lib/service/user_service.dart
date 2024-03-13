// ignore_for_file: avoid_print, dead_code, prefer_interpolation_to_compose_strings

import 'package:dio/dio.dart';
import 'package:login_signup/config/di.dart';
import 'package:login_signup/model/request/user_model_reqstar.dart';
import 'package:login_signup/model/request/user_model_login.dart';
import 'package:login_signup/model/response/user_model.dart';
import 'package:login_signup/service/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceUser extends BaseService {
  register({required UserModelReqstar userModelReqstar}) async {
    Dio dio = Dio();
    dio.options.headers['Accept'] = 'application/json';

    late Response response;
    try {
      response = await dio.post('$baseUrl/api/register',
          data: userModelReqstar.toJson());
    } catch (e) {
      return 'the email or phone is token';
      // print(e.toString());
      // print(response.data);
      // print('fouaxsaxasxasxasxasnd');
    }
    if (response.statusCode == 201) {
      config
          .get<SharedPreferences>()
          .setString('token', response.data['token']);

      UserModel userModel = UserModel.fromMap(response.data['user']);
      config.get<SharedPreferences>().setString('user', userModel.toJson());
      // user != config.get<SharedPreferences>().getString('user');
      // UserModel.fromJson(user);
      return true;
    } else {
      return false;
    }
  }

  logIn({required UserModelLogin userModelLogin}) async {
    Dio dio = Dio();
    late Response response;
    dio.options.headers['Accept'] = 'application/json';
    if (int.parse(userModelLogin.phone_number) == 0988805250) {
      return 'you are admin aren\'t to go';
    }
    try {
      response =
          await dio.post(baseUrl + '/api/login', data: userModelLogin.toJson());
      print(response.statusCode);
      print(response.data);
    } catch (e) {
      print('object');
      print(e.toString());
      return false;
    }

    if (response.statusCode == 201) {
      config
          .get<SharedPreferences>()
          .setString('token', response.data['token']);
      UserModel userModel = UserModel.fromMap(response.data['user']);
      config.get<SharedPreferences>().setString('user', userModel.toJson());
      // UserModel userMode = UserModel.fromJson(
      //     config.get<SharedPreferences>().getString('user')!);

      return true;
    } else {
      return response.data['message'];
    }
  }

  logOut() async {
    String? token = config.get<SharedPreferences>().getString('token');
    dynamic url = '$baseUrl/api/logout';
    Dio dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';

    Response response = await dio.post(url);
    return true;
    if (response.statusCode == 200) {
      print(response.data);
    } else {
      return false;
    }
  }
}
