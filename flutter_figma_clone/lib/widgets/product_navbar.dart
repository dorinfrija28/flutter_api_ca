import 'package:flutter/material.dart';
import 'package:flutter_figma_clone/controllers/product_page_controller.dart';
import 'package:get/get.dart';

class ProductNavbar extends StatelessWidget {
  const ProductNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductPageController>();
    return Material(
      elevation: 8,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 40),
        child: SizedBox(
          height: 48,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => controller.addToCart(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              elevation: 0,
            ),
            child: const Text(
              "Add to cart",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
