import 'package:http/http.dart' as http;import '../../db/cache.dart';class ApiHelper {  static const String baseUrl = 'https://back.eavtotalim.uz/v2/api/';  final http.Client client = http.Client();  Future<http.Response> myGet(String endPoint, Map<String, dynamic> params) async {    final url = Uri.parse(baseUrl + endPoint);    Map<String, String> stringParams = Map<String, String>.from(params.map((key, value) => MapEntry(key, value.toString())));    final Uri fullUrl = Uri.https(url.host, url.path, stringParams);    var token = await cache.getString('token');    final headers = {      'Content-Type': 'application/json',      'Accept': 'application/json',      'Authorization': 'Bearer ${token}',    };    final response = await http.get(fullUrl, headers: headers);    return response;  }  Future<http.Response> myPost<T>(String endPoint, T body) async {    final url = Uri.parse(baseUrl + endPoint);    final Uri fullUrl = Uri.https(url.host, url.path);    var token = await cache.getString('token');    final headers = {      'Content-Type': 'application/json',      'Accept': 'application/json',      'Authorization': 'Bearer ${token}',    };    final response = await http.post(fullUrl, headers: headers, body: body);    return response;  }}