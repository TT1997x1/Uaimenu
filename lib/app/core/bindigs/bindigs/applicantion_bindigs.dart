import 'package:application_uaimenu/app/core/restClient/rest_client.dart';
import 'package:application_uaimenu/app/core/services/shopping_service.dart';
import 'package:get/get.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RestClient(),
      fenix: true,
    );
    Get.lazyPut(() => ShoppingService());
  }
}
