import 'package:application_uaimenu/app/core/ui/widgets/uaimenu_button.dart';
import 'package:application_uaimenu/app/moldes/order_pix.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinishiPage extends StatelessWidget {
  final OrderPix _orderPix = Get.arguments;

  FinishiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
                Image.asset(
                  '',
                  width: context.widthTransformer(reducedBy: 50),
                  height: context.heightTransformer(reducedBy: 70),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Pedido realizado com sucesso, clique no botão a baixo  para acesso o QRCode do pix',
                    textAlign: TextAlign.center,
                    style: context.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColorDark,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: context.widthTransformer(reducedBy: 30),
                  child: UaimenuButton(
                    label: 'Pix',
                    onPressed: () {
                      Get.toNamed('/orders/pix', arguments: _orderPix);
                    },
                    color: context.theme.primaryColorDark,
                  ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  width: context.widthTransformer(reducedBy: 10),
                  child: UaimenuButton(
                    label: 'FECHAR',
                    onPressed: () {
                      Get.off('/home');
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
