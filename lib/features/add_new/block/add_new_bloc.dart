import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../common/repository/network_result.dart';
import '../repository/add_new_repository.dart';

part '../model/add_new_event.dart';

class AddNewBloc extends Bloc<AddNewEvent, NetworkResult> {
  final AddNewRepository _addNewRepository;

  AddNewBloc(this._addNewRepository) : super(const Loading()) {
    on<AddNewEventData>((event, emit) async {
      emit(const Loading());

      try {
        final signupResult = await _addNewRepository.ads(event);
        emit(signupResult);
      } catch (e) {
        emit(Error(message: e.toString(), data: null, code: 0));
      }
    });
  }
}
