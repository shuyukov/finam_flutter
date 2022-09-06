import 'package:finam_flutter/models/model.dart';
import 'package:finam_flutter/repositories/timeline_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc(this.timelineRepository) : super(LoadingPostsState()) {
    on<LoadingPostsEvent>(getNewPosts);
  }

  final TimelineRepository timelineRepository;

  Future getNewPosts(LoadingPostsEvent event, Emitter<PostsState> emit) async {
    try {
      final timelineData = await timelineRepository.getCurrentList();
      emit(LoadedPostsState(allPosts: timelineData));
    } catch (error, stack){
      debugPrint(stack.toString());
      emit(NetworkErrorState());
    }
  }
}
