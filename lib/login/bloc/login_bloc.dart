import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  String _email = '';
  String _password = '';
  LoginBloc() : super(LoginInitial()) {
    on<LoginInitEvent>((event, emit) async {});

    on<LoginEmailTrackerEvent>((event, emit) {
      _email = event.email;
    });
    on<LoginPasswordTrackerEvent>((event, emit) {
      _password = event.password;
    });
    on<LoginApiEvent>((event, emit) async {
      await _loginApiEvent(event, emit);
    });
  }

  FutureOr<void> _loginApiEvent(
      LoginApiEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    Future.delayed(const Duration(seconds: 2));
    try {
      final response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': _email,
          'password': _password,
        }),
      );

      if (response.statusCode == 200) {
        // Parse the response and emit success state
        emit(LoginSuccessState());
      } else {
        // Emit failure state if the login fails
        emit(LoginFailureState(
            message: 'Login failed: ${response.reasonPhrase}'));
      }
    } catch (error) {
      // Emit failure state in case of error
      emit(LoginFailureState(message: 'Login failed: $error'));
    }
  }
}
