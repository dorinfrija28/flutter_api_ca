import 'package:flutter_figma_clone/list_items/home_page_list_items/intro_banner_item.dart';
import 'package:flutter_figma_clone/list_items/new_block_card_item.dart';
import 'package:flutter_figma_clone/list_items/home_page_list_items/new_block_item.dart';
import 'package:flutter_figma_clone/list_items/sale_block_card_item.dart';
import 'package:flutter_figma_clone/list_items/home_page_list_items/sale_block_item.dart';
import 'package:flutter_figma_clone/list_items/list_item.dart';
import 'package:flutter_figma_clone/list_items/spacer_item.dart';
import 'package:domain/use_cases/get_ecommerce_data.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final GetEcommerceData getEcommerceData;

  RxList<ListItem> items = RxList();
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;
  final Map<int, RxBool> favoriteStates = <int, RxBool>{};

  HomePageController({required this.getEcommerceData});

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final ecommerceData = await getEcommerceData();

      // Clear existing items
      items.clear();

      // Add intro banner
      items.add(
        IntroBannerItem(
          imagePath: ecommerceData.header.bannerImage,
          bannerTitle: ecommerceData.header.title,
        ),
      );

      items.add(SpacerItem(height: 36));

      // Process sections
      for (var section in ecommerceData.sections) {
        if (section.title == 'Sale') {
          // Convert sale items
          final saleItems = section.items.where((item) => item.isSaleItem).map((
            item,
          ) {
            favoriteStates[item.id] = RxBool(item.isFavorite);
            return SaleBlockCardItem(
              id: item.id,
              imgPath: item.image,
              title: item.name,
              subtitle: item.brand,
              oldPrice: item.oldPrice ?? 0,
              newPrice: item.newPrice ?? 0,
              reviews: item.reviews,
              discount: item.discount ?? 0,
              rating: item.rating,
              isFavorite: item.isFavorite,
            );
          }).toList();

          if (saleItems.isNotEmpty) {
            items.add(SaleBlockItem(saleItems: saleItems));
          }
        } else if (section.title == 'New') {
          // Convert new items
          final newItems = section.items.where((item) => item.isNewItem).map((
            item,
          ) {
            favoriteStates[item.id] = RxBool(item.isFavorite);
            return NewBlockCardItem(
              id: item.id,
              imgPath: item.image,
              title: item.name,
              subtitle: item.brand,
              price: item.price ?? 0,
              reviews: item.reviews,
              rating: item.rating,
              isFavorite: item.isFavorite,
            );
          }).toList();

          if (newItems.isNotEmpty) {
            items.add(NewBlockItem(newItems: newItems));
          }
        }
      }

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = 'Failed to load data: $e';
      Get.snackbar('Error', errorMessage.value);
    }
  }

  void toggleFavorite(int itemId) {
    if (favoriteStates.containsKey(itemId)) {
      favoriteStates[itemId]!.value = !favoriteStates[itemId]!.value;
    }
  }

  bool isFavorite(int itemId) {
    return favoriteStates[itemId]?.value ?? false;
  }
}
