// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class OrderStatus {
  String status;
  String payment_status;
  String created_at;
  String updated_at;
  OrderStatus({
    required this.status,
    required this.payment_status,
    required this.created_at,
    required this.updated_at,
  });

  OrderStatus copyWith({
    String? status,
    String? payment_status,
    String? created_at,
    String? updated_at,
  }) {
    return OrderStatus(
      status: status ?? this.status,
      payment_status: payment_status ?? this.payment_status,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'payment_status': payment_status,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory OrderStatus.fromMap(Map<String, dynamic> map) {
    return OrderStatus(
      status: map['status'] as String,
      payment_status: map['payment_status'] as String,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderStatus.fromJson(String source) => OrderStatus.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderStatus(status: $status, payment_status: $payment_status, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant OrderStatus other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.payment_status == payment_status &&
      other.created_at == created_at &&
      other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return status.hashCode ^
      payment_status.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode;
  }
}
