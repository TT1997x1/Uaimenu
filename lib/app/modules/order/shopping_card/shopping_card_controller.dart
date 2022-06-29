import 'package:application_uaimenu/app/core/services/auth_services.dart';
import 'package:application_uaimenu/app/core/services/shopping_service.dart';
import 'package:application_uaimenu/app/modules/home/home_controller.dart';
import 'package:application_uaimenu/app/moldes/order.dart';
import 'package:application_uaimenu/app/moldes/shopping_card_model.dart';
import 'package:application_uaimenu/app/repositores/order/order_repository.dart';
import 'package:get/get.dart';

class ShoppingCardController extends GetxController {
  final AuthService _authService;
  final ShoppingService _shoppingService;
  final OrderRepository _orderRepository;

  final _address = ''.obs;
  final _cpf = ''.obs;

  ShoppingCardController({
    required AuthService authService,
    required ShoppingService shoppingService,
    required OrderRepository orderRepository,
  })  : _authService = authService,
        _shoppingService = shoppingService,
        _orderRepository = orderRepository;

  List<ShoppingCardModel> get products => _shoppingService.products;

  double get totalValue => _shoppingService.totalValue;

  set address(String address) => _address.value = address;
  set cpf(String cpf) => _cpf.value = cpf;

  void addQuantityInProduct(ShoppingCardModel shoppingCardModel) {
    _shoppingService.adddAndRemoveProductInShoppingCard(
        shoppingCardModel.product,
        quantity: shoppingCardModel.quantity + 1);
  }

  void subtractQuantityInProduct(ShoppingCardModel shoppingCardModel) {
    _shoppingService.adddAndRemoveProductInShoppingCard(
        shoppingCardModel.product,
        quantity: shoppingCardModel.quantity - 1);
  }

  void clear() => _shoppingService.clear();

  Future<void> createOrder() async {
    final userId = _authService.getUserId();
    final order = Order(
        userId: userId!,
        cpf: _cpf.value,
        address: _address.value,
        intems: products);

    var orderPix = await _orderRepository.createOrder(order);
    orderPix = orderPix.copyWith(totaValue: totalValue);
    clear();

    Get.offNamed('/orders/finished', arguments: orderPix);
    Get.back(id: HomeController.NAVIGATOR_KEY);
  }
}
