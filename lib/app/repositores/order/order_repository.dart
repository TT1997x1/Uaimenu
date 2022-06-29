import 'package:application_uaimenu/app/moldes/order.dart';
import 'package:application_uaimenu/app/moldes/order_pix.dart';

abstract class OrderRepository {
  Future<OrderPix> createOrder(Order order);
}
