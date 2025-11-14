import 'package:flutter/material.dart';
import 'package:flutter_figma_clone/list_items/product_page_list_items/product_details_header_item.dart';

class ProductDetailsHeaderWidget extends StatelessWidget {
  const ProductDetailsHeaderWidget({super.key, required this.item});

  final ProductDetailsHeaderItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        item.title,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontFamily: 'Metropolis',
        ),
      ),
    );
  }
}
