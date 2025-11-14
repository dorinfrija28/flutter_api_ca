import 'package:flutter_figma_clone/list_items/list_item.dart';

class ProductGalleryItem extends ListItem {
  final List<String> imagePaths;
  final double aspectRatio;

  ProductGalleryItem({required this.imagePaths, this.aspectRatio = 1});
}
