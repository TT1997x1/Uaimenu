import 'package:application_uaimenu/app/modules/menu/menu_controller.dart';
import 'package:application_uaimenu/app/repositores/products/product_repository.dart';
import 'package:application_uaimenu/app/repositores/products/product_repository_implements.dart';
import 'package:get/get.dart';

class MenuBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRepository>(
        () => ProductRepositoryIml(restClient: Get.find()));
    Get.put(MenuController(productRepository: Get.find()));
  }
}
