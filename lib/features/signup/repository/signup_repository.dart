import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;

import '../../../app/router.dart';
import '../../../common/repository/network_result.dart';
import '../../../common/utils/api_helper.dart';

class SignupRepository {
  Future<NetworkResult<Map<String, dynamic>>> signup(String firstname, String lastname, String phone, String password) async {
    final requestParameters = { "firstname": firstname, "lastname": lastname, "phone": phone, "password": password };
    var has = await checkNetwork();
    if(!has){
      return Error(message: "connection_error_message".tr(), data: null, code: 0);
    }
    final apiHelper = ApiHelper();
    final response = await apiHelper.myPost("auth/register", json.encode(requestParameters));

    try {
      return handleResponse(response);
    } catch (e) {
      return catchErrors(e);
    }
  }
}
