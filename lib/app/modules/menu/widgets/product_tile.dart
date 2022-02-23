import 'package:application_uaimenu/app/core/ui/uaimenu_ui.dart';
import 'package:application_uaimenu/app/moldes/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {

  final ProductModel product;

  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        color: Colors.red,
        margin: const EdgeInsets.all(10),
        height: 80,
        child: Row(
          children: [
            Container(
              width: 110,
              decoration: const BoxDecoration(
                  borderRadius:  BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://conteudo.imguol.com.br/c/entretenimento/a0/2021/11/06/lanche-hamburguer-x-salada-1636227034415_v2_4x3.jpg'),
                      fit: BoxFit.cover)),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(left: 20.0), 
                //const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text(
                      'Lanches artesanais',
                    style: UaimenuUi.textBold,
                ),
                    Text(
                      'Á partir de 9,99',
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
