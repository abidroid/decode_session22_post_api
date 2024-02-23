part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostSubmittingState extends PostState{}

class PostSubmittedState extends PostState {

  final PostModel postModel;

  PostSubmittedState({required this.postModel});

}

class PostSubmitErrorState extends PostState {
  final String errorMessage;

   PostSubmitErrorState({required this.errorMessage});

}

