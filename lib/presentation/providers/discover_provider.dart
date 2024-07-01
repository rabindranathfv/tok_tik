import 'package:flutter/material.dart';
import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/infraestructure/models/local_video_model.dart';
import 'package:tok_tik/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  // TODO: Create Repository and DataSource

  List<VideoPost> videos = [];
  bool initialLoading = true;

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 4));

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJsonMap(video).toVideoPostEntity())
        .toList();

    videos.addAll( newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
