
import 'package:login_signup/model/provider/base_provider.dart';

import '../request/order_model.dart';

class CartProvider extends BaseProvider{
  final List<OrderModel> basket = [];
List<OrderModel> get medicineModel=>basket ;
  void toggleFavorite(OrderModel orderModel) {
    final isExist = basket.contains(orderModel);
    if (isExist) {
      basket.remove(orderModel);
    } else {
      basket.add(orderModel);
    }
    notifyListeners();
  }

  bool isExist(OrderModel orderModel) {
    final isExist = basket.contains(orderModel);
    return isExist;
  }
}