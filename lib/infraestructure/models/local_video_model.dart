// To parse this JSON data, do
//
//     final localVideoModel = localVideoModelFromJson(jsonString);

import 'dart:convert';

import 'package:tok_tik/domain/entities/video_post.dart';

List<LocalVideoModel> localVideoModelFromJson(String str) => List<LocalVideoModel>.from(json.decode(str).map((x) => LocalVideoModel.fromJsonMap(x)));

String localVideoModelToJson(List<LocalVideoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocalVideoModel {
    final String name;
    final String videoUrl;
    final int likes;
    final int views;

    LocalVideoModel({
        required this.name,
        required this.videoUrl,
        this.likes = 0,
        this.views = 0,
    });

    factory LocalVideoModel.fromJsonMap(Map<String, dynamic> json) => LocalVideoModel(
        name: json["name"] ?? 'No Name',
        videoUrl: json["videoUrl"],
        likes: json["likes"],
        views: json["views"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "videoUrl": videoUrl,
        "likes": likes,
        "views": views,
    };

    VideoPost toVideoPostEntity() => VideoPost(
      caption: name,
      videoUrl: videoUrl,
      likes: likes,
      views: views,
    );
}
