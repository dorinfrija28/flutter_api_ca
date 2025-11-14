import 'package:flutter/material.dart';
import 'package:flutter_figma_clone/list_items/home_page_list_items/intro_banner_item.dart';

class IntroBannerWidget extends StatelessWidget {
  const IntroBannerWidget({super.key, required this.item});

  final IntroBannerItem item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.network(
          item.imagePath,
          width: double.infinity,
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
              width: double.infinity,
              height: 200,
              color: Colors.grey[300],
              child: const Icon(Icons.error, size: 50),
            );
          },
        ),

        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              item.bannerTitle,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Metropolis',
                fontSize: 34,
                letterSpacing: 1,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
