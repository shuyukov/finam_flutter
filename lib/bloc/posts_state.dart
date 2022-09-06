part of 'posts_bloc.dart';

abstract class PostsState {
  PostsState({this.data = const []});  
  final List<Children> data;
}

class LoadingPostsState extends PostsState {}

class LoadedPostsState extends PostsState {
  LoadedPostsState({required List<Children> allPosts})
      : super(data: allPosts);
}

class NetworkErrorState extends PostsState {}