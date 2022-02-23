import 'package:application_uaimenu/app/moldes/product_model.dart';
import 'package:application_uaimenu/app/moldes/product_model.dart';
import 'package:application_uaimenu/app/repositores/products/product_repository_iml.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> findAll();
}
