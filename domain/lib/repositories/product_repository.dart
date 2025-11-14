import '../entities/product_entity.dart';

abstract class ProductRepository {
  Future<ProductDetailsEntity> getProductDetails();
}
