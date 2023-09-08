import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokto_app/config/theme/app_theme.dart';
import 'package:tokto_app/infrastruture/datasources/local_video_datasource_impl.dart';
import 'package:tokto_app/infrastruture/repositories/video_posts_repository_impl.dart';
import 'package:tokto_app/presentation/screens/discover/discover_screen.dart';
import 'package:tokto_app/providers/discover_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final videoPostRepository = VideoPostsRepositoryImpl(videosDatasource: LocalVideoDatasource());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider(videoRepository: videoPostRepository)..loadNextPage() ),
      ],
      child: MaterialApp(
        title: 'toktok app',
        theme: AppTheme().getTheme(),
        home: const Scaffold(
          body: DiscoverScreen(),
        )
      ),
    );
  }
}

