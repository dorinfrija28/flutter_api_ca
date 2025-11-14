import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dto/product_dto.dart';

abstract class ProductRemoteDataSource {
  Future<ProductDetailsDto> getProductDetails();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;
  static const String baseUrl =
      'https://test-api-jlbn.onrender.com/v3/feed/details';

  ProductRemoteDataSourceImpl({http.Client? client})
    : client = client ?? http.Client();

  @override
  Future<ProductDetailsDto> getProductDetails() async {
    try {
      final response = await client.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return ProductDetailsDto.fromJson(jsonData);
      } else {
        throw Exception(
          'Failed to load product details: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Failed to load product details: $e');
    }
  }
}
