import 'package:get/get.dart';
import 'package:getxpractice/models/product_model.dart';

class ShoppingController extends GetxController {
  var _products = <Product>[].obs;
  List<Product> get products => [..._products];
  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    await Future.delayed(Duration(seconds: 5));
    var serverresponse = [
      Product(id: 1, price: 20, productName: "Alu"),
      Product(id: 2, price: 10, productName: "Kola"),
      Product(id: 3, price: 30, productName: "bread")
    ];

    _products.value = serverresponse;
  }
}
