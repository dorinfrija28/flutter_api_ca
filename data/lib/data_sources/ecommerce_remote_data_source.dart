import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dto/ecommerce_dto.dart';

abstract class EcommerceRemoteDataSource {
  Future<EcommerceDto> getEcommerceData();
}

class EcommerceRemoteDataSourceImpl implements EcommerceRemoteDataSource {
  final http.Client client;
  static const String baseUrl = 'https://test-api-jlbn.onrender.com/v3/feed';

  EcommerceRemoteDataSourceImpl({http.Client? client})
    : client = client ?? http.Client();

  @override
  Future<EcommerceDto> getEcommerceData() async {
    try {
      final response = await client.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return EcommerceDto.fromJson(jsonData);
      } else {
        throw Exception(
          'Failed to load ecommerce data: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Failed to load ecommerce data: $e');
    }
  }
}
