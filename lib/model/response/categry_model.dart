// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class CategryModel {
  int id;
  String name;
  CategryModel({
    required this.id,
    required this.name,
  });

  CategryModel copyWith({
    int? id,
    String? name,
  }) {
    return CategryModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory CategryModel.fromMap(Map<String, dynamic> map) {
    return CategryModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategryModel.fromJson(String source) =>
      CategryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategryModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant CategryModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
