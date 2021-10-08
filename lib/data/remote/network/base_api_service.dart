abstract class BaseApiService{
  final String baseUrl = "ws.audioscrobbler.com";
  final String v2Path = "/2.0/";
  final Map<String,String> keyParams = {
    "api_key": "b673c518ca2f3b8fa4e12e490cc88a46",
    "format": "json"
  };
  Future<dynamic> getRequest(String endPoint,{Map<String,String>? params});

}