import "package:dio/dio.dart";
import "package:konquer_test/repository/domain/api_client/api_url.dart";

import "../../models/users_data.dart";

class ApiClient {
  String get baseUrl => ApiUrl.baseUrl;

  Dio dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl, headers: {
    'Authorization': 'Bearer $bearerToken',
    'Content-Type': 'application/json',
  }));

  Future<Response> getData({UserQuery? userQuery}) async {
    Response response;

    try {
      response =
          await dio.get(ApiUrl.users, queryParameters: userQuery?.toMap());
    } catch (e) {
      throw Exception(e.toString());
    }
    return response;
  }
}

const bearerToken =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzA4MTU0ODc4LCJpYXQiOjE2NzY2MTg4NzgsImp0aSI6Ijc5YjY3YTZlN2FlZjQzZTA5ZDAzY2FjYTdhODlhNDAyIiwidXNlcl9pZCI6NTgzMX0.q98N_5jym6uCY9_lgn6xK9qzxw2jSI57Is8pb9uosLk";

abstract class LoadingStatus {
  bool isProcessingCompleted = false;
  bool isProcessing = false;
  bool isTimeOut = false;
  bool isError = false;

  void processingStarted() {
    isProcessing = true;
    isProcessingCompleted = false;
    isTimeOut = false;
    isError = false;
  }

  void processingCompleted() {
    isProcessing = false;
    isError = false;
    isProcessingCompleted = true;
    isTimeOut = false;
  }

  void processingFailed() {
    isTimeOut = false;
    isProcessing = false;
    isError = true;
    isProcessingCompleted = false;
  }

  void timeOut() {
    isTimeOut = true;
    isProcessing = false;
    isError = true;
    isProcessingCompleted = false;
  }
}
