import 'package:flutter/material.dart';
import 'package:flutter_figma_clone/list_items/product_page_list_items/product_info_item.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({super.key, required this.item});

  final ProductInfoItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // Title / Subtitle / Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title / Subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Metropolis',
                    ),
                  ),
                  Text(
                    item.subtitle,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Metropolis',
                    ),
                  ),
                ],
              ),
              Text(
                '\$${item.price}',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Metropolis',
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),

          // Review
          Row(
            children: [
              ...List.generate(5, (index) {
                final starIndex = index + 1;
                final isFilled = starIndex <= item.rating;
                final isHalfFilled =
                    starIndex - 0.5 <= item.rating && item.rating < starIndex;

                return Padding(
                  padding: const EdgeInsets.only(right: 1),
                  child: Icon(
                    isFilled
                        ? Icons.star
                        : isHalfFilled
                        ? Icons.star_half
                        : Icons.star_border,
                    color: isFilled || isHalfFilled
                        ? Colors.amber
                        : Colors.grey[300],
                    size: 12,
                  ),
                );
              }),
              const SizedBox(width: 4),
              Text(
                '(${item.reviews})',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Metropolis',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Details
          Text(
            item.details,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontFamily: 'Metropolis',
            ),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
