import 'dart:developer';

import 'package:application_uaimenu/app/core/restClient/rest_client.dart';
import 'package:application_uaimenu/app/moldes/product_model.dart';
import 'package:application_uaimenu/app/repositores/products/product_repository.dart';

class ProductRepositoryIml implements ProductRepository {
  final RestClient _restClient;

  ProductRepositoryIml ({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<ProductModel>> findAll() async {
    final result = await _restClient.get('/products/');

    if (result.hasError){
      log(
        ' Erro ao buscar produtos ${result.statusCode}',
        error:  result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientExcption('Erro ao buscar produtos');
    }
    return result.body.map<ProductModel>((p) => ProductModel.fromMap(p)).toList();
  
  }



  
}