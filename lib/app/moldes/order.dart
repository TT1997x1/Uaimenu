import 'package:application_uaimenu/app/moldes/shopping_card_model.dart';

class Order {
  int userId;
  String cpf;
  String address;
  List<ShoppingCardModel> intems;

  Order(
      {required this.userId,
      required this.cpf,
      required this.address,
      required this.intems});
}
