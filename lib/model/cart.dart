// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class Cart {
  String image;
  String scientific_name;
  String trade_name;
  num price;
  num order_quantity;
  num medicine_id;
  Cart({
    required this.image,
    required this.scientific_name,
    required this.trade_name,
    required this.price,
    required this.order_quantity,
    required this.medicine_id,
  });

  Cart copyWith({
    String? image,
    String? scientific_name,
    String? trade_name,
    num? price,
    num? order_quantity,
    num? medicine_id,
  }) {
    return Cart(
      image: image ?? this.image,
      scientific_name: scientific_name ?? this.scientific_name,
      trade_name: trade_name ?? this.trade_name,
      price: price ?? this.price,
      order_quantity: order_quantity ?? this.order_quantity,
      medicine_id: medicine_id ?? this.medicine_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'scientific_name': scientific_name,
      'trade_name': trade_name,
      'price': price,
      'order_quantity': order_quantity,
      'medicine_id': medicine_id,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      image: map['image'] as String,
      scientific_name: map['scientific_name'] as String,
      trade_name: map['trade_name'] as String,
      price: map['price'] as num,
      order_quantity: map['order_quantity'] as num,
      medicine_id: map['medicine_id'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) =>
      Cart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cart(image: $image, scientific_name: $scientific_name, trade_name: $trade_name, price: $price, order_quantity: $order_quantity, medicine_id: $medicine_id)';
  }

  @override
  bool operator ==(covariant Cart other) {
    if (identical(this, other)) return true;

    return other.image == image &&
        other.scientific_name == scientific_name &&
        other.trade_name == trade_name &&
        other.price == price &&
        other.order_quantity == order_quantity &&
        other.medicine_id == medicine_id;
  }

  @override
  int get hashCode {
    return image.hashCode ^
        scientific_name.hashCode ^
        trade_name.hashCode ^
        price.hashCode ^
        order_quantity.hashCode ^
        medicine_id.hashCode;
  }
}
