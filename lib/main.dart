import 'package:application_uaimenu/app/core/bindigs/bindigs/applicantion_bindigs.dart';
import 'package:application_uaimenu/app/core/ui/uaimenu_ui.dart';
import 'package:application_uaimenu/app/routes/auth_routes.dart';
import 'package:application_uaimenu/app/routes/home_routes.dart';
import 'package:application_uaimenu/app/routes/orders_router.dart';
import 'package:application_uaimenu/app/routes/product_routes.dart';
import 'package:application_uaimenu/app/routes/splash_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const Uaimenu());
}

class Uaimenu extends StatelessWidget {
  const Uaimenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Uai Menu',
      theme: UaimenuUi.theme,
      initialBinding: ApplicationBinding(),
      getPages: [
        ...SplashRouters.routers,
        ...AuthRouters.routers,
        ...HomeRouters.routers,
        ...ProductDeitailRouters.routers,
        ...OrdersRouter.routers
      ],
    );
  }
}
