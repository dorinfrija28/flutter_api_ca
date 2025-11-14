import 'package:flutter/material.dart';
import 'package:flutter_figma_clone/controllers/product_page_controller.dart';
import 'package:flutter_figma_clone/list_items/product_page_list_items/product_details_header_item.dart';
import 'package:flutter_figma_clone/list_items/product_page_list_items/product_details_item.dart';
import 'package:flutter_figma_clone/list_items/product_page_list_items/product_gallery_item.dart';
import 'package:flutter_figma_clone/list_items/product_page_list_items/product_info_item.dart';
import 'package:flutter_figma_clone/list_items/product_page_list_items/product_options_item.dart';
import 'package:flutter_figma_clone/list_items/product_page_list_items/suggestion_block_item.dart';
import 'package:flutter_figma_clone/list_items/spacer_item.dart';
import 'package:flutter_figma_clone/widgets/product_navbar.dart';
import 'package:flutter_figma_clone/widgets/product_page_widgets/product_details_header_widget.dart';
import 'package:flutter_figma_clone/widgets/product_page_widgets/product_details_widget.dart';
import 'package:flutter_figma_clone/widgets/product_page_widgets/product_gallery_widget.dart';
import 'package:flutter_figma_clone/widgets/product_page_widgets/product_info_widget.dart';
import 'package:flutter_figma_clone/widgets/product_page_widgets/product_options_widget.dart';
import 'package:flutter_figma_clone/widgets/product_page_widgets/suggestion_block_widget.dart';
import 'package:flutter_figma_clone/widgets/spacer_widget.dart';
import 'package:get/get.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productPageController = Get.find<ProductPageController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Short dress"),
        centerTitle: true,
        actions: [
          Obx(
            () => IconButton(
              onPressed: () => productPageController.toggleWishlist(),
              icon: Icon(
                productPageController.isInWishlist.value
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
              color: productPageController.isInWishlist.value
                  ? Colors.red
                  : Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () => productPageController.shareProduct(),
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      bottomNavigationBar: ProductNavbar(),
      body: Obx(() {
        if (productPageController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (productPageController.errorMessage.value.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Error: ${productPageController.errorMessage.value}',
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => productPageController.loadData(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: productPageController.items.length,
          itemBuilder: (context, index) {
            var item = productPageController.items[index];

            if (item is ProductGalleryItem) {
              return ProductGalleryWidget(item: item);
            }

            if (item is SpacerItem) {
              return SpacerWidget(item: item);
            }

            if (item is ProductOptionsItem) {
              return ProductOptionsWidget(item: item);
            }

            if (item is SuggestionBlockItem) {
              return SuggestionBlockWidget(item: item);
            }

            if (item is ProductInfoItem) {
              return ProductInfoWidget(item: item);
            }

            if (item is ProductDetailsHeaderItem) {
              return ProductDetailsHeaderWidget(item: item);
            }

            if (item is ProductDetailsItem) {
              return ProductDetailsWidget(item: item);
            }

            return const SizedBox.shrink();
          },
        );
      }),
    );
  }
}
