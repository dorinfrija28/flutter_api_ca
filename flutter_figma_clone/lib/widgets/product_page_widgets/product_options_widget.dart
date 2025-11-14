import 'package:flutter/material.dart';
import 'package:flutter_figma_clone/controllers/product_page_controller.dart';
import 'package:flutter_figma_clone/list_items/product_page_list_items/product_options_item.dart';
import 'package:get/get.dart';

class ProductOptionsWidget extends StatefulWidget {
  const ProductOptionsWidget({super.key, required this.item});
  final ProductOptionsItem item;

  @override
  State<ProductOptionsWidget> createState() => _ProductOptionsWidgetState();
}

class _ProductOptionsWidgetState extends State<ProductOptionsWidget> {
  String? _color;
  String? _size;
  late final ProductPageController _controller;

  @override
  void initState() {
    super.initState();
    _color =
        widget.item.initialColor ??
        (widget.item.colors.isNotEmpty ? widget.item.colors.first : null);
    _size =
        widget.item.initialSize ??
        (widget.item.sizes.isNotEmpty ? widget.item.sizes.first : null);
    _controller = Get.find<ProductPageController>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // Color
          Expanded(
            child: _DropBox<String>(
              value: _color,
              items: widget.item.colors,
              labelBuilder: (v) => v,
              onChanged: (v) {
                setState(() => _color = v);
                if (v != null) {
                  _controller.updateGalleryForColor(v);
                }
              },
            ),
          ),
          const SizedBox(width: 12),

          // Size
          Expanded(
            child: _DropBox<String>(
              value: _size,
              items: widget.item.sizes,
              labelBuilder: (v) => v,
              onChanged: (v) => setState(() => _size = v),
            ),
          ),
          const SizedBox(width: 12),

          // Like button
          Obx(
            () => Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Center(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 14,
                  onPressed: () => _controller.toggleWishlist(),
                  icon: Icon(
                    _controller.isInWishlist.value
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                  color: _controller.isInWishlist.value
                      ? Colors.red
                      : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Reusable styled dropdown box (looks like your screenshot)
class _DropBox<T> extends StatelessWidget {
  const _DropBox({
    required this.value,
    required this.items,
    required this.labelBuilder,
    required this.onChanged,
  });

  final T? value;
  final List<T> items;
  final String Function(T) labelBuilder;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: const Color(0xFFE0E0E0), // light grey border
          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          isExpanded: true,
          value: value,
          icon: const Icon(Icons.arrow_drop_down, size: 18),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontFamily: 'Metropolis',
          ),
          items: items
              .map(
                (e) =>
                    DropdownMenuItem<T>(value: e, child: Text(labelBuilder(e))),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
