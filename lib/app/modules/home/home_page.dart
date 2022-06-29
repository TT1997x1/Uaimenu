import 'package:application_uaimenu/app/core/ui/widgets/icon_badge.dart';
import 'package:application_uaimenu/app/core/ui/widgets/uaimenu_appbar.dart';
import 'package:application_uaimenu/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UaimenuAppbar(),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          onTap: (value) => controller.tabIndex = value,
          currentIndex: controller.tabIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'produtos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                // BottomNavigationBarItem(
                // icon: IconBadge(
                //   icon: Icons.shopping_cart,
                //   number: controller.totalProductsInShoppingCard,
                // ),
                label: 'Carrinho'),
            BottomNavigationBarItem(
                icon: Icon(Icons.exit_to_app), label: 'Sair'),
          ],
        );
      }),
      body: Navigator(
        initialRoute: '/menu',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: controller.onGeneratedRouter,
      ),
    );
  }
}
