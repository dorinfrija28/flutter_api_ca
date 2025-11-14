import 'package:flutter_figma_clone/list_items/list_item.dart';

class SaleBlockCardItem extends ListItem {
  final int id;
  final String imgPath;
  final String title;
  final String subtitle;
  final double oldPrice;
  final double newPrice;
  final int reviews;
  final int discount;
  final double rating;
  final bool isFavorite;

  SaleBlockCardItem({
    required this.id,
    required this.imgPath,
    required this.title,
    required this.subtitle,
    required this.oldPrice,
    required this.newPrice,
    required this.reviews,
    required this.discount,
    required this.rating,
    required this.isFavorite,
  });
}
