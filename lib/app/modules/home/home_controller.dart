import 'package:application_uaimenu/app/core/services/auth_services.dart';
import 'package:application_uaimenu/app/core/services/shopping_service.dart';
import 'package:application_uaimenu/app/modules/menu/menu.bindings.dart';
import 'package:application_uaimenu/app/modules/menu/menu_page.dart';
import 'package:application_uaimenu/app/modules/order/shopping_card/shopping_card_bindings.dart';
import 'package:application_uaimenu/app/modules/order/shopping_card/shopping_card_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;
  final ShoppingService _shoppingService;

  final _tabIndex = 0.obs;
  final _tabs = ['/menu', '/order/shopping_card', '/exit'];

  HomeController({required ShoppingService shoppingService})
      : _shoppingService = shoppingService;

  int get tabIndex => _tabIndex.value;

  int get totalProductsInShoppingCard => _shoppingService.totalProducts;

  set tabIndex(int index) {
    _tabIndex(index);
    if (_tabs[index] == '/exit') {
      Get.find<AuthService>().logout();
    } else {
      Get.toNamed(_tabs[index], id: NAVIGATOR_KEY);
    }
  }

  Route? onGeneratedRouter(RouteSettings settings) {
    if (settings.name == '/menu') {
      return GetPageRoute(
        settings: settings,
        page: () => const MenuPage(),
        binding: MenuBindings(),
        transition: Transition.fadeIn,
      );
    }
    if (settings.name == '/order/shopping_card') {
      return GetPageRoute(
        settings: settings,
        page: () => ShoppingCardPage(),
        binding: ShoppingCardBindings(),
        transition: Transition.fadeIn,
      );
    }
    return null;
  }
}
