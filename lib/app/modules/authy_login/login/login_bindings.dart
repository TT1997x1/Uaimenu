import 'package:application_uaimenu/app/modules/authy_login/login/login_controller.dart';
import 'package:application_uaimenu/app/repositores/auth_repository.dart';
import 'package:application_uaimenu/app/repositores/auth_repository_implements.dart';
import 'package:get/get.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(restClient: Get.find()),
    );

    Get.lazyPut(() => LoginController(authRepository: Get.find()));
  }
}
