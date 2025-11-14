import 'package:flutter/material.dart';
import 'package:flutter_figma_clone/list_items/list_item.dart';
import 'package:flutter_figma_clone/list_items/new_block_card_item.dart';
import 'package:flutter_figma_clone/list_items/product_page_list_items/product_details_header_item.dart';
import 'package:flutter_figma_clone/list_items/product_page_list_items/product_details_item.dart';
import 'package:flutter_figma_clone/list_items/product_page_list_items/product_gallery_item.dart';
import 'package:flutter_figma_clone/list_items/product_page_list_items/product_info_item.dart';
import 'package:flutter_figma_clone/list_items/product_page_list_items/product_options_item.dart';
import 'package:flutter_figma_clone/list_items/product_page_list_items/suggestion_block_item.dart';
import 'package:flutter_figma_clone/list_items/sale_block_card_item.dart';
import 'package:flutter_figma_clone/list_items/spacer_item.dart';
import 'package:domain/entities/product_entity.dart';
import 'package:domain/use_cases/get_product_details.dart';
import 'package:get/get.dart';

class ProductPageController extends GetxController {
  final GetProductDetails getProductDetails;

  RxList<ListItem> items = RxList();
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;
  ProductEntity? _productData;
  final RxString selectedColor = ''.obs;
  final RxBool isInWishlist = false.obs;

  ProductPageController({required this.getProductDetails});

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final productDetailsData = await getProductDetails();
      final product = productDetailsData.product;
      _productData = product;

      // Initialize wishlist state from product actions
      isInWishlist.value = product.actions.addToWishlist;

      // Clear existing items

      items.clear();

      // Set initial selected color
      selectedColor.value = product.colors.isNotEmpty
          ? product.colors.first.name
          : '';

      // Get images from the first color
      final initialColorImages = product.colors.isNotEmpty
          ? product.colors.first.images
          : <String>[];

      // Add product gallery
      items.add(
        ProductGalleryItem(imagePaths: initialColorImages, aspectRatio: 3 / 4),
      );

      items.add(SpacerItem(height: 12));

      // Add product options
      items.add(
        ProductOptionsItem(
          colors: product.colors.map((c) => c.name).toList(),
          sizes: product.sizes,
          initialColor: product.colors.isNotEmpty
              ? product.colors.first.name
              : null,
          initialSize: product.sizes.isNotEmpty ? product.sizes.first : null,
        ),
      );

      items.add(SpacerItem(height: 22));

      // Add product info
      items.add(
        ProductInfoItem(
          title: product.brand,
          subtitle: product.title,
          price: '${product.price.toStringAsFixed(2)} ${product.currency}',
          details: product.description,
          reviews: product.reviewsCount.toString(),
          rating: product.rating,
        ),
      );

      items.add(SpacerItem(height: 28));

      items.add(ProductDetailsHeaderItem());

      items.add(SpacerItem(height: 16));

      // Add shipping info
      items.add(
        ProductDetailsItem(
          title: 'Shipping info',
          entries: [
            ProductDetailsEntry(text: product.shippingInfo.delivery),
            ProductDetailsEntry(text: product.shippingInfo.returns),
          ],
        ),
      );

      // Add support
      items.add(
        ProductDetailsItem(
          title: 'Support',
          entries: [
            ProductDetailsEntry(text: product.support.contactEmail),
            ProductDetailsEntry(text: 'FAQ', url: product.support.faqUrl),
          ],
        ),
      );

      items.add(SpacerItem(height: 24));

      // Add related products
      final suggestionItems = <ListItem>[];
      for (var relatedProduct in productDetailsData.relatedProducts) {
        if (relatedProduct.isSaleItem) {
          suggestionItems.add(
            SaleBlockCardItem(
              id:
                  int.tryParse(
                    relatedProduct.id.replaceAll(RegExp(r'[^0-9]'), ''),
                  ) ??
                  0,
              imgPath: relatedProduct.image,
              title: relatedProduct.title,
              subtitle: relatedProduct.brand,
              oldPrice: relatedProduct.oldPrice ?? 0,
              newPrice: relatedProduct.price,
              reviews: relatedProduct.reviewsCount,
              discount: relatedProduct.discount != null
                  ? int.tryParse(
                          relatedProduct.discount!.replaceAll(
                            RegExp(r'[^0-9]'),
                            '',
                          ),
                        ) ??
                        0
                  : 0,
              rating: relatedProduct.rating,
              isFavorite: false,
            ),
          );
        } else {
          suggestionItems.add(
            NewBlockCardItem(
              id:
                  int.tryParse(
                    relatedProduct.id.replaceAll(RegExp(r'[^0-9]'), ''),
                  ) ??
                  0,
              imgPath: relatedProduct.image,
              title: relatedProduct.title,
              subtitle: relatedProduct.brand,
              price: relatedProduct.price,
              reviews: relatedProduct.reviewsCount,
              rating: relatedProduct.rating,
              isFavorite: false,
            ),
          );
        }
      }

      if (suggestionItems.isNotEmpty) {
        items.add(SuggestionBlockItem(suggestionItems: suggestionItems));
      }

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = 'Failed to load product data: $e';
      Get.snackbar('Error', errorMessage.value);
    }
  }

  void updateGalleryForColor(String colorName) {
    if (_productData == null) return;

    // Find the color and get its images
    final selectedColorData = _productData!.colors.firstWhere(
      (c) => c.name == colorName,
      orElse: () => _productData!.colors.first,
    );

    // Find the gallery item and update it
    final galleryIndex = items.indexWhere((item) => item is ProductGalleryItem);
    if (galleryIndex != -1) {
      items[galleryIndex] = ProductGalleryItem(
        imagePaths: selectedColorData.images,
        aspectRatio: 3 / 4,
      );
      selectedColor.value = colorName;
    }
  }

  void addToCart() {
    if (_productData != null) {
      Get.snackbar(
        'Added to Cart',
        '${_productData!.title} has been added to your cart',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void toggleWishlist() {
    isInWishlist.value = !isInWishlist.value;
    Get.snackbar(
      isInWishlist.value ? 'Added to Wishlist' : 'Removed from Wishlist',
      isInWishlist.value
          ? '${_productData?.title ?? "Product"} has been added to your wishlist'
          : '${_productData?.title ?? "Product"} has been removed from your wishlist',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: isInWishlist.value ? Colors.green : Colors.orange,
      colorText: Colors.white,
    );
  }

  void shareProduct() {
    if (_productData != null) {
      // You can integrate with share_plus package or use platform channels
      Get.snackbar(
        'Share',
        'Sharing ${_productData!.title}...',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
