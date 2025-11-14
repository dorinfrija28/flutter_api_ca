import 'package:json_annotation/json_annotation.dart';

part 'ecommerce_dto.g.dart';

@JsonSerializable()
class EcommerceDto {
  final HeaderDto header;
  final List<SectionDto> sections;

  EcommerceDto({required this.header, required this.sections});

  factory EcommerceDto.fromJson(Map<String, dynamic> json) =>
      _$EcommerceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EcommerceDtoToJson(this);
}

@JsonSerializable()
class HeaderDto {
  final String title;
  @JsonKey(name: 'bannerImage')
  final String bannerImage;

  HeaderDto({required this.title, required this.bannerImage});

  factory HeaderDto.fromJson(Map<String, dynamic> json) =>
      _$HeaderDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HeaderDtoToJson(this);
}

@JsonSerializable()
class SectionDto {
  final String title;
  final String subtitle;
  final List<SectionItemDto> items;

  SectionDto({
    required this.title,
    required this.subtitle,
    required this.items,
  });

  factory SectionDto.fromJson(Map<String, dynamic> json) =>
      _$SectionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SectionDtoToJson(this);
}

@JsonSerializable()
class SectionItemDto {
  final int id;
  final String brand;
  final String name;
  final String image;
  final double? oldPrice;
  final double? newPrice;
  final double? price;
  final int? discount;
  final double rating;
  final int reviews;
  @JsonKey(name: 'isNew')
  final bool? isNew;
  @JsonKey(name: 'isFavorite')
  final bool isFavorite;

  SectionItemDto({
    required this.id,
    required this.brand,
    required this.name,
    required this.image,
    this.oldPrice,
    this.newPrice,
    this.price,
    this.discount,
    required this.rating,
    required this.reviews,
    this.isNew,
    required this.isFavorite,
  });

  factory SectionItemDto.fromJson(Map<String, dynamic> json) =>
      _$SectionItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SectionItemDtoToJson(this);
}
