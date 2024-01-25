part of '../block/signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignupEventData extends SignupEvent {
  final String username;
  final String password;

  SignupEventData({required this.username, required this.password});
}
