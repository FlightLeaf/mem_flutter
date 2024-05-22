// To parse this JSON data, do
//
//     final newMvModel = newMvModelFromJson(jsonString);

import 'dart:convert';

MvModel newMvModelFromJson(String str) => MvModel.fromJson(json.decode(str));

String newMvModelToJson(MvModel data) => json.encode(data.toJson());

class MvModel {
  int id;
  String name;
  String artistName;
  String cover;
  String url;

  MvModel({
    required this.id,
    required this.name,
    required this.artistName,
    required this.cover,
    required this.url,
  });

  factory MvModel.fromJson(Map<String, dynamic> json) => MvModel(
    id: json["id"],
    name: json["name"],
    artistName: json["artistName"],
    cover: json["cover"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "artistName": artistName,
    "cover": cover,
    "url": url,
  };
}

