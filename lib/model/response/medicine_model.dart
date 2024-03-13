// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, unused_import
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:login_signup/model/response/categry_model.dart';
import 'package:login_signup/model/response/expiration_data.dart';

class MedicineModel {
  num id;
  num category_id;
  String scientific_name;
  String trade_name;
  String company;
  String image;
  num price;
  String created_at;
  String updated_at;
  CategryModel category;
  List<ExpirationData> expiration_dates;
  MedicineModel({
    required this.id,
    required this.category_id,
    required this.scientific_name,
    required this.trade_name,
    required this.company,
    required this.image,
    required this.price,
    required this.created_at,
    required this.updated_at,
    required this.category,
    required this.expiration_dates,
  });

  MedicineModel copyWith({
    num? id,
    num? category_id,
    String? scientific_name,
    String? trade_name,
    String? company,
    String? image,
    num? price,
    String? created_at,
    String? updated_at,
    CategryModel? category,
    List<ExpirationData>? expiration_dates,
  }) {
    return MedicineModel(
      id: id ?? this.id,
      category_id: category_id ?? this.category_id,
      scientific_name: scientific_name ?? this.scientific_name,
      trade_name: trade_name ?? this.trade_name,
      company: company ?? this.company,
      image: image ?? this.image,
      price: price ?? this.price,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      category: category ?? this.category,
      expiration_dates: expiration_dates ?? this.expiration_dates,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category_id': category_id,
      'scientific_name': scientific_name,
      'trade_name': trade_name,
      'company': company,
      'image': image,
      'price': price,
      'created_at': created_at,
      'updated_at': updated_at,
      'category': category.toMap(),
      'expiration_dates': expiration_dates.map((x) => x.toMap()).toList(),
    };
  }

  factory MedicineModel.fromMap(Map<String, dynamic> map) {
    return MedicineModel(
      id: map['id'] as num,
      category_id: map['category_id'] as num,
      scientific_name: map['scientific_name'] as String,
      trade_name: map['trade_name'] as String,
      company: map['company'] as String,
      image: map['image'] as String,
      price: map['price'] as num,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
      category: CategryModel.fromMap(map['category'] as Map<String, dynamic>),
      expiration_dates: List<ExpirationData>.from(
        (map['expiration_dates'] as List<dynamic>).map<ExpirationData>(
          (x) => ExpirationData.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicineModel.fromJson(String source) =>
      MedicineModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MedicineModel(id: $id, category_id: $category_id, scientific_name: $scientific_name, trade_name: $trade_name, company: $company, image: $image, price: $price, created_at: $created_at, updated_at: $updated_at, category: $category, expiration_dates: $expiration_dates)';
  }

  @override
  bool operator ==(covariant MedicineModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.category_id == category_id &&
        other.scientific_name == scientific_name &&
        other.trade_name == trade_name &&
        other.company == company &&
        other.image == image &&
        other.price == price &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.category == category &&
        listEquals(other.expiration_dates, expiration_dates);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        category_id.hashCode ^
        scientific_name.hashCode ^
        trade_name.hashCode ^
        company.hashCode ^
        image.hashCode ^
        price.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        category.hashCode ^
        expiration_dates.hashCode;
  }
}
