import 'package:tok_tik/domain/entities/video_post.dart';

abstract class VideoPostDatasource {
  Future<List<VideoPost>> getTredingVideposByPage( int page );
  Future<List<VideoPost>> getFavoriteVideoByUser( String userId );
}