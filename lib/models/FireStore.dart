// ignore: unused_import
import 'dart:convert';

class UserFireStore {
  String? id;
  String? name;
  String? age;
  String? phone;
  UserFireStore({this.id, this.age, this.name, this.phone});

  factory UserFireStore.fromJson(Map<String, dynamic> json) => UserFireStore(
      name: json["name"],
      id: json["id"],
      age: json["age"],
      phone: json["phone"]);

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'age': age, 'phone': phone};
}
