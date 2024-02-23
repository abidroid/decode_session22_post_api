import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:decode_session22_post_api/models/post_model.dart';
import 'package:decode_session22_post_api/repos/post_repository.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostRepository postRepository = PostRepository();

  PostBloc() : super(PostInitial()) {
    on<PostEvent>((event, emit) async {
      if (event is SubmitPostEvent) {
        emit(PostSubmittingState());

        try{
          final postModel = await postRepository.submitPost(
            postTitle: event.postTitle,
            postBody: event.postBody,
          );

          emit(PostSubmittedState(postModel: postModel));

        }
        catch(e){

          emit(PostSubmitErrorState(errorMessage: e.toString()));
        }
      }

      if (event is ClearPostEvent) {}
    });
  }
}
