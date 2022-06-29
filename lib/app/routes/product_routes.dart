import 'package:application_uaimenu/app/modules/product_detail/product_detail_bindings.dart';
import 'package:application_uaimenu/app/modules/product_detail/product_detail_page.dart';
import 'package:get/get.dart';

class ProductDeitailRouters {
  ProductDeitailRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/product_detail',
      binding: ProductDetailBindings(),
      page: () => const ProductDetailPage(),
    )
  ];
}
