import '../entities/ecommerce_entity.dart';

abstract class EcommerceRepository {
  Future<EcommerceEntity> getEcommerceData();
}
