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
        final loginResult = await loginRepository.login(event.username, event.password);
        if (loginResult.data?["access_token"] != null) {
          await cache.setString('token', loginResult.data?["access_token"] ?? "");
          final meResult = await loginRepository.me(loginResult.data?["access_token"]);
          await cache.setInt(cache.role, meResult.data?["data"]["user"]["role"]);
          await cache.setString(cache.username, event.username??"");
          await cache.setString(cache.password, event.password??"");

          emit(meResult);

          // emit(Success(data: meResult));
        } else
          emit(loginResult);
      } catch (e) {
        emit(Error(message: e.toString(), data: null, code: 0));
      }
    });
  }
}
