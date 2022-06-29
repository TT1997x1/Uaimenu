import 'package:application_uaimenu/app/repositores/order/order_repository.dart';
import 'package:application_uaimenu/app/repositores/order/order_repository/order_repository_implements.dart';
import 'package:get/get.dart';
import './shopping_card_controller.dart';

class ShoppingCardBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderRepository>(
        () => OrderRepositoryImpl(restClient: Get.find()));
    Get.put(ShoppingCardController(
        authService: Get.find(),
        shoppingService: Get.find(),
        orderRepository: Get.find()));
  }
}
