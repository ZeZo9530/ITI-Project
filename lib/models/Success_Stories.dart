// To parse this JSON data, do
//
//     final succsessStoriesModel = succsessStoriesModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

SuccsessStoriesModel succsessStoriesModelFromJson(String str) =>
    SuccsessStoriesModel.fromJson(json.decode(str));

String succsessStoriesModelToJson(SuccsessStoriesModel data) =>
    json.encode(data.toJson());

class SuccsessStoriesModel {
  final int? statusCode;
  final bool? success;
  final String? message;
  final List<Model>? model;
  final Meta? meta;
  final dynamic errors;

  SuccsessStoriesModel({
    this.statusCode,
    this.success,
    this.message,
    this.model,
    this.meta,
    this.errors,
  });

  factory SuccsessStoriesModel.fromJson(Map<String, dynamic> json) =>
      SuccsessStoriesModel(
        statusCode: json["statusCode"],
        success: json["success"],
        message: json["message"],
        model: json["model"] == null
            ? []
            : List<Model>.from(json["model"]!.map((x) => Model.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        errors: json["errors"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "success": success,
        "message": message,
        "model": model == null
            ? []
            : List<dynamic>.from(model!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
        "errors": errors,
      };
}

class Meta {
  final int? lastPage;

  Meta({
    this.lastPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        lastPage: json["lastPage"],
      );

  Map<String, dynamic> toJson() => {
        "lastPage": lastPage,
      };
}

class Model {
  final String? id;
  final String? title;
  final String? image;
  final DateTime? createdAt;

  Model({
    this.id,
    this.title,
    this.image,
    this.createdAt,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "createdAt": createdAt?.toIso8601String(),
      };
}
