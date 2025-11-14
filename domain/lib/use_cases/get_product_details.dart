import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetProductDetails {
  final ProductRepository repository;

  GetProductDetails(this.repository);

  Future<ProductDetailsEntity> call() {
    return repository.getProductDetails();
  }
}
