part of '../block/add_new_bloc.dart';

@immutable
abstract class AddNewEvent {}

class AddNewEventData extends AddNewEvent {
  final String username;
  final String password;

  AddNewEventData({required this.username, required this.password});
}

