import 'package:application_uaimenu/app/moldes/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> findAll();
}
