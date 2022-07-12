// ignore_for_file: file_names

import 'dart:convert';

// Convert List of Posts
List<PostModel> postModelsFromJson(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));
String postModelsToJson(List<PostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Convert Single Post
PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));
String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  // Post Model
  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  // Fields
  dynamic userId;
  int id;
  String title;
  String body;

  // Convert to Model from JSON
  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  // Convert to JSON from Model
  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
