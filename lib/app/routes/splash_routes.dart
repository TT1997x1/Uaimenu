import 'package:application_uaimenu/app/modules/splash/splash_bindings.dart';
import 'package:application_uaimenu/app/modules/splash/splash_page.dart';
import 'package:get/get.dart';

class SplashRouters {
  SplashRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/splash',
      binding: SplashBindings(),
      page: () => const SplashPage(),
    )
  ];
}
