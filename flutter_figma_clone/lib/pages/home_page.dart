import 'package:flutter/material.dart';
import 'package:flutter_figma_clone/controllers/home_page_controller.dart';
import 'package:flutter_figma_clone/list_items/home_page_list_items/intro_banner_item.dart';
import 'package:flutter_figma_clone/list_items/home_page_list_items/new_block_item.dart';
import 'package:flutter_figma_clone/list_items/home_page_list_items/sale_block_item.dart';
import 'package:flutter_figma_clone/list_items/spacer_item.dart';
import 'package:flutter_figma_clone/widgets/home_page_widgets/intro_banner_widget.dart';
import 'package:flutter_figma_clone/widgets/home_page_widgets/new_block_widget.dart';
import 'package:flutter_figma_clone/widgets/home_page_widgets/sale_block_widget.dart';
import 'package:flutter_figma_clone/widgets/spacer_widget.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    final homePageController = Get.find<HomePageController>();
    return Scaffold(
      body: Obx(() {
        if (homePageController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (homePageController.errorMessage.value.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Error: ${homePageController.errorMessage.value}',
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => homePageController.loadData(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: homePageController.items.length,
          itemBuilder: (context, index) {
            var item = homePageController.items[index];
            if (item is SpacerItem) {
              return SpacerWidget(item: item);
            }
            if (item is IntroBannerItem) {
              return IntroBannerWidget(item: item);
            }
            if (item is SaleBlockItem) {
              return SaleBlockWidget(item: item);
            }
            if (item is NewBlockItem) {
              return NewBlockWidget(item: item);
            }

            return const SizedBox.shrink();
          },
        );
      }),
    );
  }
}
