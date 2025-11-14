import 'package:flutter/material.dart';
import 'package:flutter_figma_clone/list_items/new_block_card_item.dart';
import 'package:flutter_figma_clone/list_items/product_page_list_items/suggestion_block_item.dart';
import 'package:flutter_figma_clone/list_items/sale_block_card_item.dart';
import 'package:flutter_figma_clone/widgets/new_block_card_widget.dart';
import 'package:flutter_figma_clone/widgets/sale_block_card_widget.dart';

class SuggestionBlockWidget extends StatelessWidget {
  const SuggestionBlockWidget({super.key, required this.item});

  final SuggestionBlockItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'You can also like this',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Metropolis',
                ),
              ),

              Text(
                '${item.suggestionItems.length} items',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
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
            itemCount: item.suggestionItems.length,
            itemBuilder: (context, index) {
              final card = item.suggestionItems[index];

              if (card is SaleBlockCardItem) {
                return SaleBlockCardWidget(item: card);
              } else if (card is NewBlockCardItem) {
                return NewBlockCardWidget(item: card);
              }

              return SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
