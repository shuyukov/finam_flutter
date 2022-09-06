import 'package:finam_flutter/bloc/posts_bloc.dart';
import 'package:finam_flutter/data_providers/api.dart';
import 'package:finam_flutter/repositories/timeline_repository.dart';
import 'package:flutter/material.dart';
import 'pages/timeline.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final TimelineRepository _postsRepository = TimelineRepository(ApiDataProvider());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => PostsBloc(_postsRepository),
        child: const Timeline(),
      ),
    );
  }
}