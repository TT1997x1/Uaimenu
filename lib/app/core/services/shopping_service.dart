import 'package:application_uaimenu/app/moldes/product_model.dart';
import 'package:application_uaimenu/app/moldes/shopping_card_model.dart';
import 'package:get/get.dart';

class ShoppingService extends GetxService {
  final _shoppingCard = <int, ShoppingCardModel>{}.obs;

  List<ShoppingCardModel> get products => _shoppingCard.values.toList();
  int get totalProducts => _shoppingCard.values.length;

  ShoppingCardModel? getById(int id) => _shoppingCard[id];

  double get totalValue {
    return _shoppingCard.values.fold(0, (totalValue, shoppingCardModel) {
      totalValue +=
          shoppingCardModel.product.price * shoppingCardModel.quantity;
      return totalValue;
    });
  }

  void adddAndRemoveProductInShoppingCard(
    ProductModel product, {
    required int quantity,
  }) {
    if (quantity == 0) {
      _shoppingCard.remove(product.id);
    } else {
      _shoppingCard.update(product.id, (product) {
        product.quantity = quantity;
        return product;
      }, ifAbsent: () {
        return ShoppingCardModel(quantity: quantity, product: product);
      });
    }
  }

  void clear() => _shoppingCard.clear();
}
