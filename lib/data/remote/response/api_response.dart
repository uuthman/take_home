import 'package:take_home/data/remote/response/status.dart';

class ApiResponse<T>{
  T? responseObject;
  Status? statusCode;
  String? statusMessage;

  ApiResponse(this.statusCode,this.statusMessage,this.responseObject);

  ApiResponse.initialize() : statusCode = Status.initialize;
  ApiResponse.loading() : statusCode = Status.loading;
  ApiResponse.result(this.responseObject) : statusCode = Status.result;
  ApiResponse.error(this.statusMessage) : statusCode = Status.error;
}