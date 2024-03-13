// ignore_for_file: camel_case_types, avoid_print, prefer_interpolation_to_compose_strings, non_constant_identifier_names, file_names

import 'package:login_signup/config/di.dart';
import 'package:login_signup/main.dart';
import 'package:login_signup/model/response/medicine_model.dart';
import 'package:login_signup/service/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProdectService extends BaseService {
  Future getAllProduct();
  Future getOneProdect({required String id});
  Future getProductofcategory({required String id_category});
  serachMedicine(String nameMadicine);
  serachCategory(String nameCategory);

  // getAllProductcategories();
}

class Prodect_Service extends ProdectService {
  @override
  Future getProductofcategory({required String id_category}) async {
    String? token = config.get<SharedPreferences>().getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      response = await dio.get(baseUrl + '/api/medicine/category/$id_category');
      print(response.data['data']['medicines']);
      return response.data['data']['medicines'];
    } catch (e) {
      return [];
    }
  }

  @override
  Future getAllProduct() async {
    String? token = config.get<SharedPreferences>().getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    try {
      response = await dio.get(baseUrl + '/api/category');
      tempCategry = response.data['data'];
    } catch (e) {
      return false;
    }
    try {
      response = await dio.get(baseUrl + '/api/medicine/');
      print(response.data['data']);
      return response.data['data'];
    } catch (e) {
      return false;
      // print('asfffffffffff');
    }
  }

  @override
  Future<MedicineModel> getOneProdect({required String id}) async {
    String? token = config.get<SharedPreferences>().getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    response = await dio.get(baseUrl + '/api/medicine/' + id);
    return response.data['data'];
  }

  @override
  serachMedicine(String nameMadicine) async {
    String? token = config.get<SharedPreferences>().getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    if (nameMadicine.isEmpty) {
      nameMadicine = '    ';
    }
    try {
      response = await dio.get(baseUrl + '/api/medicine/search/$nameMadicine');
      print(response.data['data']);
      return response.data['data'];
    } catch (e) {
      return [];
    }
  }

  @override
  serachCategory(String nameCategory) async {
    String? token = config.get<SharedPreferences>().getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    if (nameCategory.isEmpty) {
      nameCategory = '    ';
    }
    try {
      response = await dio.get(baseUrl + '/api/category/search/$nameCategory');
      print(response.data['data']);
      return response.data['data'];
    } catch (e) {
      return [];
    }
  }

  // @override
  // getAllProductcategories() async {
  //   Response response = await dio.get(baseUrl);
  //   return response;
  // }
}
