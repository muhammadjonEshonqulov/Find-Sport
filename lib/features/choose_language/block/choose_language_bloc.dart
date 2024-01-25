import 'package:bloc/bloc.dart';

import '../../../common/repository/network_result.dart';
import '../model/choose_language_event.dart';
import '../repository/choose_language_repository.dart';

class ChooseLanguageBloc extends Bloc<ChooseLanguageEvent, NetworkResult> {
  final ChooseLanguageRepository loginRepository;

  ChooseLanguageBloc(super.initialState, this.loginRepository);
}
