import 'package:flutter/material.dart';
import 'package:flutter_figma_clone/controllers/home_page_controller.dart';
import 'package:flutter_figma_clone/controllers/product_page_controller.dart';
import 'package:flutter_figma_clone/pages/home_page.dart';
import 'package:flutter_figma_clone/pages/product_page.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:data/data_sources/ecommerce_remote_data_source.dart';
import 'package:data/data_sources/product_remote_data_source.dart';
import 'package:data/repositories/ecommerce_repository_impl.dart';
import 'package:data/repositories/product_repository_impl.dart';
import 'package:domain/use_cases/get_ecommerce_data.dart';
import 'package:domain/use_cases/get_product_details.dart';

void main() {
  // Initialize dependencies
  final ecommerceRemoteDataSource = EcommerceRemoteDataSourceImpl();
  final productRemoteDataSource = ProductRemoteDataSourceImpl();

  final ecommerceRepository = EcommerceRepositoryImpl(
    remoteDataSource: ecommerceRemoteDataSource,
  );
  final productRepository = ProductRepositoryImpl(
    remoteDataSource: productRemoteDataSource,
  );

  final getEcommerceData = GetEcommerceData(ecommerceRepository);
  final getProductDetails = GetProductDetails(productRepository);

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
          binding: BindingsBuilder(() {
            Get.put(HomePageController(getEcommerceData: getEcommerceData));
          }),
        ),
        GetPage(
          name: '/product-page',
          page: () => const ProductPage(),
          binding: BindingsBuilder(() {
            Get.put(
              ProductPageController(getProductDetails: getProductDetails),
            );
          }),
        ),
      ],
    ),
  );
}
