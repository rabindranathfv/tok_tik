import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tok_tik/config/theme/app_theme.dart';
import 'package:tok_tik/infraestructure/datasources/local_video_datasource_impl.dart';
import 'package:tok_tik/infraestructure/repositories/video_post_repository_impl.dart';
import 'package:tok_tik/presentation/providers/discover_provider.dart';
import 'package:tok_tik/presentation/screen/discover/discover_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final videoPostRepository = VideoPostsRepositoryImpl(videosDatasource: LocalVideoDataSource());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider(videoRepository: videoPostRepository)..loadNextPage())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TokTik',
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen()
      ),
    );
  }
}
