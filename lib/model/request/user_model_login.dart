// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class UserModelLogin {
  String phone_number;
  String password;
  UserModelLogin({
    required this.phone_number,
    required this.password,
  });

  UserModelLogin copyWith({
    String? phone_number,
    String? password,
  }) {
    return UserModelLogin(
      phone_number: phone_number ?? this.phone_number,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone_number': phone_number,
      'password': password,
    };
  }

  factory UserModelLogin.fromMap(Map<String, dynamic> map) {
    return UserModelLogin(
      phone_number: map['phone_number'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModelLogin.fromJson(String source) =>
      UserModelLogin.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserModelLogin(phone_number: $phone_number, password: $password)';

  @override
  bool operator ==(covariant UserModelLogin other) {
    if (identical(this, other)) return true;

    return other.phone_number == phone_number && other.password == password;
  }

  @override
  int get hashCode => phone_number.hashCode ^ password.hashCode;
}
