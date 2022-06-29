import 'package:application_uaimenu/app/core/ui/uaimenu_ui.dart';
import 'package:application_uaimenu/app/core/ui/widgets/plus_minus_box.dart';
import 'package:application_uaimenu/app/core/ui/widgets/uaimenu_appbar.dart';
import 'package:application_uaimenu/app/core/ui/widgets/uaimenu_button.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UaimenuAppbar(),
      body: LayoutBuilder(builder: (_, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              maxWidth: constraints.maxWidth,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: context.width,
                  height: context.heightTransformer(reducedBy: 60),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              // 'http://dartweek.acdemiadoflutter.com.br/images${controller.product.image}'
                              'https://conteudo.imguol.com.br/c/entretenimento/a0/2021/11/06/lanche-hamburguer-x-salada-1636227034415_v2_4x3.jpg'),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    //controller.product.name
                    'Lanche',
                    style: context.textTheme.headline4!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    //controller.product.description
                    'Lanche',
                    style: context.textTheme.bodyText2!
                        .copyWith(color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() {
                  return PlusMinusBox(
                    minusCallback: controller.removeProduct,
                    plusCallback: controller.addProduct,
                    // price: controller.product.price,
                    price: 5.00,
                    quantity: 1,
                    // quantity: controller.quantity,
                  );
                }),
                const Divider(),
                ListTile(
                  title: const Text('total', style: UaimenuUi.textBold),
                  trailing: Obx(() {
                    return const Text('200', style: UaimenuUi.textBold);
                  }),
                  //trailing: Text(FormatterHelper.formatCurrency(controller.totalPrice)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    width: context.widthTransformer(reducedBy: 10),
                    child: UaimenuButton(
                        label:
                            controller.alreadyAdded ? 'ATUALIZAR' : 'ADICIONAR',
                        onPressed: controller.addProductInShoppingCard),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
