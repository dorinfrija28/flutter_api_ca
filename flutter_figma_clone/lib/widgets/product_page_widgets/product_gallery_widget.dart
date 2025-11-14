import 'package:flutter/material.dart';
import 'package:flutter_figma_clone/list_items/product_page_list_items/product_gallery_item.dart';

class ProductGalleryWidget extends StatefulWidget {
  const ProductGalleryWidget({super.key, required this.item});
  final ProductGalleryItem item;

  @override
  State<ProductGalleryWidget> createState() => _ProductGalleryWidgetState();
}

class _ProductGalleryWidgetState extends State<ProductGalleryWidget> {
  late final PageController _controller = PageController();
  int _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imgs = widget.item.imagePaths;

    return Column(
      children: [
        // Main carousel
        AspectRatio(
          aspectRatio: widget.item.aspectRatio, // matches your layout
          child: PageView.builder(
            controller: _controller,
            itemCount: imgs.length,
            onPageChanged: (i) => setState(() => _index = i),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, i) => _ImageCard(path: imgs[i]),
          ),
        ),
        const SizedBox(height: 8),
        // Dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(imgs.length, (i) {
            final active = i == _index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: active ? 18 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: active ? Colors.black : Colors.black26,
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
        const SizedBox(height: 12),
        // (Optional) horizontal thumbs – uncomment if you want them
        // _ThumbStrip(
        //   imagePaths: imgs,
        //   current: _index,
        //   onTap: (i) => _controller.animateToPage(
        //     i,
        //     duration: const Duration(milliseconds: 250),
        //     curve: Curves.easeInOut,
        //   ),
        // ),
      ],
    );
  }
}

class _ImageCard extends StatelessWidget {
  const _ImageCard({required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Image.network(
        path,
        fit: BoxFit.contain,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[300],
            child: const Center(child: Icon(Icons.error, size: 50)),
          );
        },
      ),
    );
  }
}

// Optional thumbnails strip (commented above)
/*
class _ThumbStrip extends StatelessWidget {
  const _ThumbStrip({
    required this.imagePaths,
    required this.current,
    required this.onTap,
  });

  final List<String> imagePaths;
  final int current;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemCount: imagePaths.length,
        itemBuilder: (_, i) {
          final selected = i == current;
          return GestureDetector(
            onTap: () => onTap(i),
            child: Container(
              width: 64,
              decoration: BoxDecoration(
                border: Border.all(
                  color: selected ? Colors.black : Colors.transparent,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(imagePaths[i], fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}
*/
