// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class ExpirationData {
  num id;
  num medicine_id;
  String expiration_date;
  String production_date;
  ExpirationData({
    required this.id,
    required this.medicine_id,
    required this.expiration_date,
    required this.production_date,
  });

  ExpirationData copyWith({
    num? id,
    num? medicine_id,
    String? expiration_date,
    String? production_date,
  }) {
    return ExpirationData(
      id: id ?? this.id,
      medicine_id: medicine_id ?? this.medicine_id,
      expiration_date: expiration_date ?? this.expiration_date,
      production_date: production_date ?? this.production_date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'medicine_id': medicine_id,
      'expiration_date': expiration_date,
      'production_date': production_date,
    };
  }

  factory ExpirationData.fromMap(Map<String, dynamic> map) {
    return ExpirationData(
      id: map['id'] as num,
      medicine_id: map['medicine_id'] as num,
      expiration_date: map['expiration_date'] as String,
      production_date: map['production_date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpirationData.fromJson(String source) =>
      ExpirationData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExpirationData(id: $id, medicine_id: $medicine_id, expiration_date: $expiration_date, production_date: $production_date)';
  }

  @override
  bool operator ==(covariant ExpirationData other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.medicine_id == medicine_id &&
        other.expiration_date == expiration_date &&
        other.production_date == production_date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        medicine_id.hashCode ^
        expiration_date.hashCode ^
        production_date.hashCode;
  }
}
