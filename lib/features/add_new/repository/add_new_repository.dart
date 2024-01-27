import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:find_sport/features/add_new/block/add_new_bloc.dart';
import 'package:http/http.dart' as http;

import '../../../app/router.dart';
import '../../../common/repository/network_result.dart';
import '../../../common/utils/api_helper.dart';

class AddNewRepository {
  Future<NetworkResult<Map<String, dynamic>>> ads(AddNewEventData event) async {
    final requestParameters = { "title": event.title, "description": event.description, "lot": event.lot, "lat": event.lat };
    var has = await checkNetwork();
    if(!has){
      return Error(message: "connection_error_message".tr(), data: null, code: 0);
    }
    final apiHelper = ApiHelper();
    final response = await apiHelper.myPost("ads", json.encode(requestParameters));

    try {
      return handleResponse(response);
    } catch (e) {
      return catchErrors(e);
    }
  }
}
