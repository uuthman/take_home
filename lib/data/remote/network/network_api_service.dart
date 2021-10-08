import 'dart:convert';

import 'package:take_home/data/remote/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService{
  @override
  Future getRequest(String endPoint, {Map<String, String>? params}) async{
    params ??= <String, String>{};
    params.addAll(keyParams);
    var url = Uri.http(baseUrl,v2Path + endPoint,params);
    final response = await http.get(url);
    return jsonDecode(response.body);
  }




}