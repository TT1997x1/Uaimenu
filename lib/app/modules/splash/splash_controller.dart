import 'package:application_uaimenu/app/core/services/auth_services.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  void checkLogged() {
    Get.putAsync(() => AuthService().init());

  }
}