import 'package:flutter/material.dart';
import 'package:flutter_figma_clone/list_items/spacer_item.dart';

class SpacerWidget extends StatelessWidget {
  const SpacerWidget({super.key, required this.item});

  final SpacerItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: item.height);
  }
}
