import 'package:application_uaimenu/app/modules/order/shopping_card/shopping_card_bindings.dart';
import 'package:get/get.dart';

import '../modules/order/shopping_card/shopping_card_page.dart';

class CarrinhoRoutes {
  CarrinhoRoutes._();
  static final routers = <GetPage>[
    GetPage(
      name: '/carrinho',
      binding: ShoppingCardBindings(),
      page: () => ShoppingCardPage(),
    )
  ];
}
