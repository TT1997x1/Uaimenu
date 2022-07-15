import 'package:application_uaimenu/app/modules/command/command_bindings.dart';
import 'package:get/get.dart';

import '../modules/command/command_page.dart';

class ComandaRoutes {
  ComandaRoutes._();
  static final routers = <GetPage>[
    GetPage(
      name: '/',
      binding: CommandBindings(),
      page: () => const CommandPage(),
    )
  ];
}
