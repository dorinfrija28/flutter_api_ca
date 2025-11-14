import 'package:flutter_figma_clone/list_items/list_item.dart';

class ProductOptionsItem extends ListItem {
  final List<String> colors;
  final List<String> sizes;
  final String? initialColor;
  final String? initialSize;

  ProductOptionsItem({
    required this.colors,
    required this.sizes,
    this.initialColor,
    this.initialSize,
  });
}
