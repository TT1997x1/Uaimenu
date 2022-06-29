import 'package:application_uaimenu/app/core/services/shopping_service.dart';
import 'package:application_uaimenu/app/moldes/product_model.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  final _product = Rx<ProductModel>(Get.arguments);
  final _totalPrice = 0.0.obs;
  final _quantity = 1.obs;
  final ShoppingService _shoppingService;
  final _alreadyAdded = false.obs;

  ProductDetailController({
    required ShoppingService shoppingService,
  }) : _shoppingService = shoppingService;

  ProductModel get product => _product.value;
  double get totalPrice => _totalPrice.value;
  int get quantity => _quantity.value;
  bool get alreadyAdded => _alreadyAdded.value;

  @override
  void onInit() {
    super.onInit();
    _totalPrice(product.price);

    ever<int>(_quantity, (quantity) {
      _totalPrice(product.price * quantity);
    });

    final productShoppingCard = _shoppingService.getById(product.id);

    if (productShoppingCard != null) {
      _quantity(productShoppingCard.quantity);
      _alreadyAdded(true);
    }
  }

  void addProduct() {
    _quantity.value += 1;
  }

  void removeProduct() {
    if (quantity > 1) {
      _quantity.value -= 1;
    }
  }

  void addProductInShoppingCard() {
    _shoppingService.adddAndRemoveProductInShoppingCard(product,
        quantity: quantity);
    Get.back();
  }
}
