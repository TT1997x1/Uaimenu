import 'package:application_uaimenu/app/modules/home/home_bindings.dart';
import 'package:application_uaimenu/app/modules/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeRouters {
  HomeRouters._();

  static final routers = <GetPage> [
    GetPage(
      name: '/home',
      binding: HomeBindings(),
       page: () => const HomePage(),
       )
    
  ] ;
}