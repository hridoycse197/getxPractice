// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getxpractice/controllers/cart_controller.dart';
import 'package:getxpractice/controllers/shopping_controller.dart';

class HomePage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(controller.products[index].productName),
                          trailing:
                              Text(controller.products[index].price.toString()),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              cartController
                                  .addToCart(controller.products[index]);
                            },
                            child: const Text('Add to Cart'))
                      ],
                    ),
                  );
                },
              );
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GetX<CartController>(
                builder: (cont) => Text(
                  "Total Amount: ${cont.total.value.toString()}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              GetX<CartController>(
                builder: (controllers) => Text(
                    "Cart :${controllers.cartItems.value.length}",
                    style: TextStyle(fontSize: 20)),
              ),
            ],
          )
        ],
      )),
    );
  }
}
