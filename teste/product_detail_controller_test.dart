import 'package:application_uaimenu/app/moldes/product_model.dart';
import 'package:application_uaimenu/app/moldes/shopping_card_model.dart';
import 'package:flutter_test/flutter_test.dart';


main(){

  test('Quantidade igual a 60', (){
    ProductModel productModel = ProductModel(
      price: 12,
      name: 'abacaxi',
      description: '',
      id: 1,
      image: 'ddd',  
  );
  ShoppingCardModel shoppingCardModel = ShoppingCardModel(quantity: 100, product: productModel);
       
       var result = shoppingCardModel.quantity /100;

        expect(result, 1);
  });
}