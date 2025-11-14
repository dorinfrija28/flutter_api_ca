import 'package:flutter/material.dart';
import 'package:flutter_figma_clone/controllers/home_page_controller.dart';
import 'package:flutter_figma_clone/list_items/new_block_card_item.dart';
import 'package:get/get.dart';

class NewBlockCardWidget extends StatelessWidget {
  const NewBlockCardWidget({super.key, required this.item});

  final NewBlockCardItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          width: 150,
          height: 260,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          item.imgPath,
                          width: 148,
                          height: 184,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              width: 148,
                              height: 184,
                              color: Colors.grey[200],
                              child: const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 148,
                              height: 184,
                              color: Colors.grey[300],
                              child: const Icon(Icons.error, size: 30),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          width: 40,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(29),
                            color: Colors.black,
                          ),
                          child: Center(
                            child: Text(
                              'NEW',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Metropolis',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: -17,
                    right: 0,
                    child: Container(
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
                        child: GetX<HomePageController>(
                          builder: (controller) {
                            final favoriteState =
                                controller.favoriteStates[item.id];
                            final isFav =
                                favoriteState?.value ?? item.isFavorite;
                            return IconButton(
                              padding: EdgeInsets.zero,
                              iconSize: 14,
                              onPressed: () {
                                controller.toggleFavorite(item.id);
                              },
                              icon: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                              ),
                              color: isFav ? Colors.red : Colors.grey,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),

              // Star Rating
              Row(
                children: [
                  ...List.generate(5, (index) {
                    final starIndex = index + 1;
                    final isFilled = starIndex <= item.rating;
                    final isHalfFilled =
                        starIndex - 0.5 <= item.rating &&
                        item.rating < starIndex;

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
                  const SizedBox(width: 1),
                  Text(
                    "${item.reviews}",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Metropolis',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 6),
              // Subtitle
              Text(
                item.subtitle,
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Metropolis',
                ),
              ),
              const SizedBox(height: 3),

              // Title
              Text(
                item.title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Metropolis',
                ),
              ),
              const SizedBox(height: 3),

              // Price
              Text(
                "${item.price}\$",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Metropolis',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
