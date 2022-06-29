import 'package:application_uaimenu/app/modules/authy_login/login_page.dart';
import 'package:application_uaimenu/app/modules/authy_login/register/register_bindings.dart';
import 'package:application_uaimenu/app/modules/authy_login/register/register_page.dart';
import 'package:application_uaimenu/app/modules/login_bindings.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AuthRouters {
  AuthRouters._();

  static final routers = <GetPage>[
    GetPage(
      //name: '/auth/login',
      name: '/',
      binding: LoginBindings(),
      page: () => const LoginPage(),
    ),
    GetPage(
      name: '/auth/register',
      binding: RegisterBindings(),
      page: () => const RegisterPage(),
    ),
  ];
}
