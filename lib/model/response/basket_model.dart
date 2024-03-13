// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:login_signup/model/response/order_status.dart';

class BasketMOdel {
  num id;
  String created_at;
  String updated_at;
  OrderStatus order_status;
  PriceTotale price_totale = PriceTotale(data: 0, message: 'message');
  //   quintity;
  List<Order> orders;
  BasketMOdel({
    required this.id,
    required this.created_at,
    required this.updated_at,
    required this.order_status,
    required this.orders,
  }) {
    // dynamic temp = ServiceBasket().showPrice(id_bask: id);
    // Future.delayed(Duration(seconds: 2));
    // price_totale = PriceTotale.fromMap(temp);
  }

  BasketMOdel copyWith({
    num? id,
    String? created_at,
    String? updated_at,
    OrderStatus? order_status,
    List<Order>? orders,
  }) {
    return BasketMOdel(
      id: id ?? this.id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      order_status: order_status ?? this.order_status,
      orders: orders ?? this.orders,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': created_at,
      'updated_at': updated_at,
      'order_status': order_status.toMap(),
      'orders': orders.map((x) => x.toMap()).toList(),
    };
  }

  factory BasketMOdel.fromMap(Map<String, dynamic> map) {
    return BasketMOdel(
      id: map['id'] as num,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
      order_status:
          OrderStatus.fromMap(map['order_status'] as Map<String, dynamic>),
      orders: List<Order>.from(
        (map['orders'] as List<dynamic>).map<Order>(
          (x) => Order.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory BasketMOdel.fromJson(String source) =>
      BasketMOdel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BasketMOdel(id: $id, created_at: $created_at, updated_at: $updated_at, order_status: $order_status, orders: $orders)';
  }

  @override
  bool operator ==(covariant BasketMOdel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.order_status == order_status &&
        listEquals(other.orders, orders);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        order_status.hashCode ^
        orders.hashCode;
  }
}

class Order {
  num id;
  num medicine_id;
  num basket_id;
  num order_quantity;
  String created_at;
  String updated_at;
  Order({
    required this.id,
    required this.medicine_id,
    required this.basket_id,
    required this.order_quantity,
    required this.created_at,
    required this.updated_at,
  });

  Order copyWith({
    num? id,
    num? medicine_id,
    num? basket_id,
    num? order_quantity,
    String? created_at,
    String? updated_at,
  }) {
    return Order(
      id: id ?? this.id,
      medicine_id: medicine_id ?? this.medicine_id,
      basket_id: basket_id ?? this.basket_id,
      order_quantity: order_quantity ?? this.order_quantity,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'medicine_id': medicine_id,
      'basket_id': basket_id,
      'order_quantity': order_quantity,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] as num,
      medicine_id: map['medicine_id'] as num,
      basket_id: map['basket_id'] as num,
      order_quantity: map['order_quantity'] as num,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Order(id: $id, medicine_id: $medicine_id, basket_id: $basket_id, order_quantity: $order_quantity, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant Order other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.medicine_id == medicine_id &&
        other.basket_id == basket_id &&
        other.order_quantity == order_quantity &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        medicine_id.hashCode ^
        basket_id.hashCode ^
        order_quantity.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}

class PriceTotale {
  num data;
  String message;
  PriceTotale({
    required this.data,
    required this.message,
  });

  PriceTotale copyWith({
    num? data,
    String? message,
  }) {
    return PriceTotale(
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
      'message': message,
    };
  }

  factory PriceTotale.fromMap(Map<String, dynamic> map) {
    return PriceTotale(
      data: map['data'] as num,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PriceTotale.fromJson(String source) =>
      PriceTotale.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PriceTotale(data: $data, message: $message)';

  @override
  bool operator ==(covariant PriceTotale other) {
    if (identical(this, other)) return true;

    return other.data == data && other.message == message;
  }

  @override
  int get hashCode => data.hashCode ^ message.hashCode;
}
