import 'dart:developer';

import 'package:application_uaimenu/app/core/restClient/rest_client.dart';
import 'package:application_uaimenu/app/moldes/order.dart';
import 'package:application_uaimenu/app/moldes/order_pix.dart';
import 'package:application_uaimenu/app/repositores/order/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final RestClient _restClient;
  OrderRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;
  @override
  Future<OrderPix> createOrder(Order order) async {
    final result = await _restClient.post('/order/', {
      'userId': order.userId,
      'cpf': order.cpf,
      'addres': order.address,
      'items': order.intems
          .map((shoppingCard) => {
                'quantity': shoppingCard.quantity,
                'productId': shoppingCard.product.id,
              })
          .toList()
    });

    if (result.hasError) {
      log(
        'Error ao realizar pedido ${result.statusCode}',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientExcption('Erro ao realizar pedido');
    }
    return OrderPix.fromMap(result.body);
  }
}
