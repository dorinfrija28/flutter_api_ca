import 'package:domain/entities/product_entity.dart';
import 'package:domain/repositories/product_repository.dart';
import '../data_sources/product_remote_data_source.dart';
import '../mappers/product_mapper.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ProductDetailsEntity> getProductDetails() async {
    try {
      final dto = await remoteDataSource.getProductDetails();
      return ProductMapper.toEntity(dto);
    } catch (e) {
      throw Exception('Failed to get product details: $e');
    }
  }
}
