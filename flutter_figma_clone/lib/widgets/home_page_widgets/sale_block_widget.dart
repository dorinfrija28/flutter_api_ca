import 'package:flutter/material.dart';
import 'package:flutter_figma_clone/list_items/home_page_list_items/sale_block_item.dart';

import '../sale_block_card_widget.dart';

class SaleBlockWidget extends StatelessWidget {
  const SaleBlockWidget({super.key, required this.item});

  final SaleBlockItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sale',
                    style: TextStyle(
                      fontSize: 34,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Metropolis',
                    ),
                  ),
                  Text(
                    'Super summer sale',
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
                'View all',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Metropolis',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 300,
          child: ListView.separated(
            separatorBuilder: (_, __) => const SizedBox(width: 0),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: item.saleItems.length,
            itemBuilder: (context, index) {
              final card = item.saleItems[index];

              return SaleBlockCardWidget(item: card);
            },
          ),
        ),
      ],
    );
  }
}
