import 'package:flutter_figma_clone/list_items/list_item.dart';

class ProductInfoItem extends ListItem {
  final String title;
  final String subtitle;
  final String price;
  final String details;
  final String reviews;
  final double rating;

  ProductInfoItem({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.details,
    required this.reviews,
    required this.rating,
  });
}
