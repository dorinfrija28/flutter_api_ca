import 'package:flutter_figma_clone/list_items/list_item.dart';

class NewBlockCardItem extends ListItem {
  final int id;
  final String imgPath;
  final String title;
  final String subtitle;
  final double price;
  final int reviews;
  final double rating;
  final bool isFavorite;

  NewBlockCardItem({
    required this.id,
    required this.imgPath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.reviews,
    required this.rating,
    required this.isFavorite,
  });
}
