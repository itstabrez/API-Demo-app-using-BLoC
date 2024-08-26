import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_api_using_bloc_1/Api/post_api.dart';
import 'package:flutter_api_using_bloc_1/model/post_model.dart';
import 'package:flutter_api_using_bloc_1/utils/enums.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  PostApi postApi = PostApi();
  HomeBloc() : super(const HomeInitial(status: PostStatus.loading)) {
    on<HomeInitEvent>((event, emit) async {
      await _homeInitEvent(event, emit);
    });
  }
  FutureOr<void> _homeInitEvent(
      HomeInitEvent event, Emitter<HomeState> emit) async {
    emit(const HomeLoadingState(status: PostStatus.loading));
    await Future.delayed(const Duration(seconds: 3));
    final posts = await postApi.fetchingPost().onError((error, stackTrace) {
      emit(HomeFailureState(
          message: error.toString(), status: PostStatus.failure));
      throw (stackTrace);
    }); // Fetch posts from API
    emit(
      HomeSuccessState(postModel: posts, status: PostStatus.success),
    ); // Emit success state with data
  }
}
