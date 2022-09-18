import 'package:get/get.dart';

import '../models/product_model.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  // double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
  RxInt total = 0.obs;

  addToCart(Product product) {
    cartItems.add(product);
    total.value += product.price;
  }
}
