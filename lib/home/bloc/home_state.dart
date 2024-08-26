part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  final PostStatus status;

  const HomeState({required this.status});
}

final class HomeInitial extends HomeState {
  const HomeInitial({required super.status});
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState({required super.status});
}

class HomeSuccessState extends HomeState {
  final List<PostModel> postModel;
  const HomeSuccessState({required this.postModel, required super.status});
}

class HomeFailureState extends HomeState {
  final String message;

  const HomeFailureState({required this.message, required super.status});
}
