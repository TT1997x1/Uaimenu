import 'dart:developer';

import 'package:application_uaimenu/app/core/exception_user_exception.dart';
import 'package:application_uaimenu/app/core/restClient/rest_client.dart';
import 'package:application_uaimenu/app/moldes/user_moldes.dart';
import 'package:application_uaimenu/app/repositores/auth_repository_implements.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _restClient;

  AuthRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final result = await _restClient.post('/auth/register', {
      'name': name,
      'email': email,
      'password': password,
    });

    if (result.hasError) {
      var message = 'Erro ao registrar usuário';
      if (result.statusCode == 400) {
        message = result.body['error'];
      }
      log(
        message,
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientExcption(message);
    }
    return login(email, password);
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _restClient.post(
      '/auth/login',
      {
        'email': email,
        'password': password,
      },
    );
    if (result.hasError) {
      if (result.statusCode == 403) {
        log('usuario ou senha invalidos',
            error: result.statusText, stackTrace: StackTrace.current);
        throw UserNotFoundException();
      }
      log(
        'Error ao autenticar o usuário (${result.statusCode})',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientExcption('Error ao autenticar usuário');
    }
    return UserModel.fromMap(result.body);
  }
}
