// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.id,
    required this.videoUrl,
    required this.name,
    required this.description,
    required this.duration,
    required this.createdBy,
    required this.image,
    required this.thumbnail,
    required this.cropped,
    required this.fileNameOriginal,
    required this.popularity,
    required this.categoryId,
    required this.category,
    required this.keywords,
  });

  String id;
  String videoUrl;
  String name;
  String description;
  String duration;
  String createdBy;
  String image;
  String thumbnail;
  String cropped;
  String fileNameOriginal;
  String popularity;
  String categoryId;
  Category category;
  String keywords;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    id: json["id"],
    videoUrl: json["video_url"],
    name: json["name"],
    description: json["description"],
    duration: json["duration"],
    createdBy: json["created_by"],
    image: json["image"],
    thumbnail: json["thumbnail"],
    cropped: json["cropped"],
    fileNameOriginal: json["file_name_original"],
    popularity: json["popularity"],
    categoryId: json["category_id"],
    category: json["category"],
    keywords: json["keywords"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "video_url": videoUrl,
    "name": name,
    "description": description,
    "duration": duration,
    "created_by": createdBy,
    "image": image,
    "thumbnail": thumbnail,
    "cropped": cropped,
    "file_name_original": fileNameOriginal,
    "popularity": popularity,
    "category_id": categoryId,
    "category": category,
    "keywords": keywords,
  };
}

enum Category { CRAFT, DANCE, ART }



