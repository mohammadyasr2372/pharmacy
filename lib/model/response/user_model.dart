// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class UserModel {
  String name;
  String email;
  String phone_number;
  String updated_at;
  String created_at;
  int id;
  UserModel({
    required this.name,
    required this.email,
    required this.phone_number,
    required this.updated_at,
    required this.created_at,
    required this.id,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? phone_number,
    String? updated_at,
    String? created_at,
    int? id,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone_number: phone_number ?? this.phone_number,
      updated_at: updated_at ?? this.updated_at,
      created_at: created_at ?? this.created_at,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phone_number': phone_number,
      'updated_at': updated_at,
      'created_at': created_at,
      'id': id,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      phone_number: map['phone_number'] as String,
      updated_at: map['updated_at'] as String,
      created_at: map['created_at'] as String,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, phone_number: $phone_number, updated_at: $updated_at, created_at: $created_at, id: $id)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.phone_number == phone_number &&
        other.updated_at == updated_at &&
        other.created_at == created_at &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        phone_number.hashCode ^
        updated_at.hashCode ^
        created_at.hashCode ^
        id.hashCode;
  }
}
