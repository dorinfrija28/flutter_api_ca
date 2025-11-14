import 'package:json_annotation/json_annotation.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDetailsDto {
  final ProductDto product;
  @JsonKey(name: 'relatedProducts')
  final List<RelatedProductDto> relatedProducts;

  ProductDetailsDto({required this.product, required this.relatedProducts});

  factory ProductDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsDtoToJson(this);
}

@JsonSerializable()
class ProductDto {
  final String id;
  final String title;
  final String brand;
  final String description;
  final double price;
  final String currency;
  final double rating;
  @JsonKey(name: 'reviewsCount')
  final int reviewsCount;
  final List<ProductColorDto> colors;
  final List<String> sizes;
  @JsonKey(name: 'shippingInfo')
  final ShippingInfoDto shippingInfo;
  final SupportDto support;
  final ProductActionsDto actions;

  ProductDto({
    required this.id,
    required this.title,
    required this.brand,
    required this.description,
    required this.price,
    required this.currency,
    required this.rating,
    required this.reviewsCount,
    required this.colors,
    required this.sizes,
    required this.shippingInfo,
    required this.support,
    required this.actions,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}

@JsonSerializable()
class ProductColorDto {
  final String name;
  final String hex;
  final List<String> images;

  ProductColorDto({
    required this.name,
    required this.hex,
    required this.images,
  });

  factory ProductColorDto.fromJson(Map<String, dynamic> json) =>
      _$ProductColorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductColorDtoToJson(this);
}

@JsonSerializable()
class ShippingInfoDto {
  final String delivery;
  final String returns;

  ShippingInfoDto({required this.delivery, required this.returns});

  factory ShippingInfoDto.fromJson(Map<String, dynamic> json) =>
      _$ShippingInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingInfoDtoToJson(this);
}

@JsonSerializable()
class SupportDto {
  @JsonKey(name: 'contactEmail')
  final String contactEmail;
  @JsonKey(name: 'faqUrl')
  final String faqUrl;

  SupportDto({required this.contactEmail, required this.faqUrl});

  factory SupportDto.fromJson(Map<String, dynamic> json) =>
      _$SupportDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SupportDtoToJson(this);
}

@JsonSerializable()
class ProductActionsDto {
  @JsonKey(name: 'addToCart')
  final bool addToCart;
  @JsonKey(name: 'addToWishlist')
  final bool addToWishlist;
  final bool share;

  ProductActionsDto({
    required this.addToCart,
    required this.addToWishlist,
    required this.share,
  });

  factory ProductActionsDto.fromJson(Map<String, dynamic> json) =>
      _$ProductActionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductActionsDtoToJson(this);
}

@JsonSerializable()
class RelatedProductDto {
  final String id;
  final String title;
  final String brand;
  final double price;
  final double? oldPrice;
  final String currency;
  final String? discount;
  final double rating;
  @JsonKey(name: 'reviewsCount')
  final int reviewsCount;
  final String image;

  RelatedProductDto({
    required this.id,
    required this.title,
    required this.brand,
    required this.price,
    this.oldPrice,
    required this.currency,
    this.discount,
    required this.rating,
    required this.reviewsCount,
    required this.image,
  });

  factory RelatedProductDto.fromJson(Map<String, dynamic> json) =>
      _$RelatedProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedProductDtoToJson(this);
}
