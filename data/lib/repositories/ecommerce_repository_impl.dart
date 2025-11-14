import 'package:domain/entities/ecommerce_entity.dart';
import 'package:domain/repositories/ecommerce_repository.dart';
import '../data_sources/ecommerce_remote_data_source.dart';
import '../mappers/ecommerce_mapper.dart';

class EcommerceRepositoryImpl implements EcommerceRepository {
  final EcommerceRemoteDataSource remoteDataSource;

  EcommerceRepositoryImpl({required this.remoteDataSource});

  @override
  Future<EcommerceEntity> getEcommerceData() async {
    try {
      final dto = await remoteDataSource.getEcommerceData();
      return EcommerceMapper.toEntity(dto);
    } catch (e) {
      throw Exception('Failed to get ecommerce data: $e');
    }
  }
}
