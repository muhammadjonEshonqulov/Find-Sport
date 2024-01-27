part of '../block/add_new_bloc.dart';

@immutable
abstract class AddNewEvent {}

class AddNewEventData extends AddNewEvent {
  final String title;
  final String description;
  final double lot;
  final double lat;

  AddNewEventData({required this.title, required this.description, required this.lat, required this.lot});
}
