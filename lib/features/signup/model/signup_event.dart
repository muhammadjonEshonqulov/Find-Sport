part of '../block/signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignupEventData extends SignupEvent {
  final String firstname;
  final String lastname;
  final String phone;
  final String password;

  SignupEventData({required this.firstname, required this.lastname, required this.phone, required this.password});
}
