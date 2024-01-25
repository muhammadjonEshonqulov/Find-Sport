import 'package:bloc/bloc.dart';

import '../../../common/repository/network_result.dart';
import '../model/me_event.dart';
import '../repository/me_repository.dart';

class MeBloc extends Bloc<MeEvent, NetworkResult> {
  final MeRepository loginRepository;

  MeBloc(super.initialState, this.loginRepository);
}
