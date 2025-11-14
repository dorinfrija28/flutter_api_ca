import 'package:flutter/material.dart';
import 'package:flutter_figma_clone/list_items/product_page_list_items/product_details_item.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({super.key, required this.item});

  final ProductDetailsItem item;

  static const _borderColor = Color(0xFFEDEDED);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: _borderColor, width: 1),
          bottom: BorderSide(color: _borderColor, width: 1),
        ),
      ),
      child: Theme(
        // Remove ExpansionTile's default divider so only our borders show
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: item.initiallyOpen,
          title: Text(
            item.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Metropolis',
            ),
          ),
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          children: item.entries.map((e) {
            final textWidget = Text(
              e.text,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontFamily: 'Metropolis',
              ),
            );

            if (e.url == null) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: SizedBox.shrink(),
              ).copyWith(child: textWidget);
            }

            // Clickable (FAQ)
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: InkWell(onTap: () => _openUrl(e.url!), child: textWidget),
            );
          }).toList(),
        ),
      ),
    );
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

// Small helper to allow padding + child (syntactic sugar)
extension on Padding {
  Padding copyWith({Widget? child, EdgeInsets? padding}) =>
      Padding(padding: padding ?? this.padding, child: child ?? this.child);
}
