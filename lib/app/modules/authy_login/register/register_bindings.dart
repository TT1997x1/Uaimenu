//import 'dart:html';

import 'package:application_uaimenu/app/modules/authy_login/register/register_controller.dart';
import 'package:application_uaimenu/app/repositores/auth_repository.dart';
import 'package:application_uaimenu/app/repositores/auth_repository_iml.dart';
import 'package:get/get.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(restClient: Get.find()),
    );

    Get.lazyPut(() => RegisterController(authRepository: Get.find()));
  }
}
