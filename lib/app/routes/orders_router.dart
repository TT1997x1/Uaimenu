import 'package:application_uaimenu/app/modules/order/finishi/finishi_page.dart';
import 'package:application_uaimenu/app/modules/order/pix/pix.page.dart';
import 'package:get/get.dart';

class OrdersRouter {
  OrdersRouter._();
  static final routers = <GetPage>[
    GetPage(name: '/orders/finished', page: () => FinishiPage()),
    GetPage(name: '/orders/pix', page: () => PixPage()),
  ];
}
