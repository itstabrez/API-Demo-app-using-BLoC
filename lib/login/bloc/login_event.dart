// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginEmailTrackerEvent extends LoginEvent {
  final String email;

  LoginEmailTrackerEvent({required this.email});
}

class LoginInitEvent extends LoginEvent {
  BuildContext context;

  LoginInitEvent(this.context);
}

class LoginPasswordTrackerEvent extends LoginEvent {
  final String password;

  LoginPasswordTrackerEvent({required this.password});
}

class LoginApiEvent extends LoginEvent {}
