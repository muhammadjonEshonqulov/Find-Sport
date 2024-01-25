import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../common/repository/network_result.dart';
import '../../../db/cache.dart';
import '../repository/signup_repository.dart';

part '../model/signup_event.dart';

class SignupBloc extends Bloc<SignupEvent, NetworkResult> {
  final SignupRepository loginRepository;

  SignupBloc(this.loginRepository) : super(const Loading()) {
    on<SignupEventData>((event, emit) async {
      emit(const Loading());

      try {
        final loginResult = await loginRepository.signup(event.firstname, event.lastname, event.phone, event.password);
        if (loginResult.data?["access_token"] != null) {
          await cache.setString('token', loginResult.data?["accessToken"] ?? "");
          emit(loginResult);
        } else
          emit(loginResult);
      } catch (e) {
        emit(Error(message: e.toString(), data: null, code: 0));
      }
    });
  }
}
