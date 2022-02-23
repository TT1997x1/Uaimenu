import 'package:get/get.dart';

class RestClient extends GetConnect {
  final _backendBaseUrl = 'http://dartweek.academiadoflutter.com.br';

  RestClient() {
    httpClient.baseUrl = _backendBaseUrl;
  }
}

class RestClientExcption implements Exception {
  final int? code;
  final String message;
  RestClientExcption(
    this.message, {
    this.code,
  });

  @override
  String toString() => 'RestClientExecption(code: $code, message: $message)';
}
