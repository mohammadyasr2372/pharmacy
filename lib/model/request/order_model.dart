// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class OrderModel {
  num medicine_id;
  num basket_id;
  num order_quantity;
  OrderModel({
    required this.medicine_id,
    required this.basket_id,
    required this.order_quantity,
  });

  OrderModel copyWith({
    num? medicine_id,
    num? basket_id,
    num? order_quantity,
  }) {
    return OrderModel(
      medicine_id: medicine_id ?? this.medicine_id,
      basket_id: basket_id ?? this.basket_id,
      order_quantity: order_quantity ?? this.order_quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'medicine_id': medicine_id,
      'basket_id': basket_id,
      'order_quantity': order_quantity,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      medicine_id: map['medicine_id'] as num,
      basket_id: map['basket_id'] as num,
      order_quantity: map['order_quantity'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'OrderModel(medicine_id: $medicine_id, basket_id: $basket_id, order_quantity: $order_quantity)';

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.medicine_id == medicine_id &&
        other.basket_id == basket_id &&
        other.order_quantity == order_quantity;
  }

  @override
  int get hashCode =>
      medicine_id.hashCode ^ basket_id.hashCode ^ order_quantity.hashCode;
}
