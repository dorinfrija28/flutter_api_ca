import '../entities/ecommerce_entity.dart';
import '../repositories/ecommerce_repository.dart';

class GetEcommerceData {
  final EcommerceRepository repository;

  GetEcommerceData(this.repository);

  Future<EcommerceEntity> call() {
    return repository.getEcommerceData();
  }
}
