import 'dart:developer';
import 'dart:html';

import 'package:application_uaimenu/app/core/mixins/loader_mixins.dart';
import 'package:application_uaimenu/app/core/mixins/messagen_mixins.dart';
import 'package:application_uaimenu/app/moldes/product_model.dart';
import 'package:application_uaimenu/app/repositores/products/product_repository.dart';
import 'package:get/get.dart';

class MenuController extends GetxController with LoaderMixin, MessagesMixin {
  final ProductRepository _productRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  final menu = <ProductModel>[].obs;

  MenuController({
    required ProductRepository productRepository,
  }) : _productRepository = productRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      _loading.toggle();
      await findAllProducts();
      _loading.toggle();
    } catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      _message(
        MessageModel(
            title: 'Erro',
            message: 'Erro ao buscar menu',
            type: MessageType.error),
      );
    }
  }

  Future<void> findAllProducts() async {
    final products = await _productRepository.findAll();
    menu.assignAll(products);
  }
}
