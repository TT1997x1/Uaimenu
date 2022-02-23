import 'package:application_uaimenu/app/modules/menu/menu_controller.dart';
import 'package:application_uaimenu/app/modules/menu/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MenuPage extends GetView<MenuController> {

  const MenuPage ({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
    return ListView.builder(
      itemCount: controller.menu.length,
      itemBuilder: (context, index) {
        final prod = controller.menu[index];
     return ProductTile(product: prod);
      },
    );
    });
  }
  
}