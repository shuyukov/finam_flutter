part of 'posts_bloc.dart';

abstract class PostsEvent {}

class LoadingPostsEvent extends PostsEvent {}

class RefreshingPostsEvent extends PostsEvent {}