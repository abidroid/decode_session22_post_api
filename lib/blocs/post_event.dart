part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class SubmitPostEvent extends PostEvent{
  String postTitle, postBody;

  SubmitPostEvent({required this.postTitle, required this.postBody});

}

class ClearPostEvent extends PostEvent {}
