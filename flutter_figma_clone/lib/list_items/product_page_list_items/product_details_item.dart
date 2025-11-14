import 'package:flutter_figma_clone/list_items/list_item.dart';

class ProductDetailsEntry {
  final String text;
  final String? url;

  ProductDetailsEntry({required this.text, this.url});
}

class ProductDetailsItem extends ListItem {
  final String title;
  final List<ProductDetailsEntry> entries;
  final bool initiallyOpen;

  ProductDetailsItem({
    required this.title,
    required this.entries,
    this.initiallyOpen = false,
  });
}
