// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class UserModelReqstar {
  String phone_number;
  String password;
  String name;
  String email;
  UserModelReqstar({
    required this.phone_number,
    required this.password,
    required this.name,
    required this.email,
  });

  UserModelReqstar copyWith({
    String? phone_number,
    String? password,
    String? name,
    String? email,
  }) {
    return UserModelReqstar(
      phone_number: phone_number ?? this.phone_number,
      password: password ?? this.password,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone_number': phone_number,
      'password': password,
      'name': name,
      'email': email,
    };
  }

  factory UserModelReqstar.fromMap(Map<String, dynamic> map) {
    return UserModelReqstar(
      phone_number: map['phone_number'] as String,
      password: map['password'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModelReqstar.fromJson(String source) =>
      UserModelReqstar.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModelReqstar(phone_number: $phone_number, password: $password, name: $name, email: $email)';
  }

  @override
  bool operator ==(covariant UserModelReqstar other) {
    if (identical(this, other)) return true;

    return other.phone_number == phone_number &&
        other.password == password &&
        other.name == name &&
        other.email == email;
  }

  @override
  int get hashCode {
    return phone_number.hashCode ^
        password.hashCode ^
        name.hashCode ^
        email.hashCode;
  }
}
