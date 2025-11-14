import 'package:json_annotation/json_annotation.dart';

part 'product_models.g.dart';

@JsonSerializable()
class ProductDetailsJson {
  final Product product;
  @JsonKey(name: 'relatedProducts')
  final List<RelatedProduct> relatedProducts;

  ProductDetailsJson({required this.product, required this.relatedProducts});

  factory ProductDetailsJson.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsJsonFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsJsonToJson(this);
}

@JsonSerializable()
class Product {
  final String id;
  final String title;
  final String brand;
  final String description;
  final double price;
  final String currency;
  final double rating;
  @JsonKey(name: 'reviewsCount')
  final int reviewsCount;
  final List<ProductColor> colors;
  final List<String> sizes;
  @JsonKey(name: 'shippingInfo')
  final ShippingInfo shippingInfo;
  final Support support;
  final ProductActions actions;

  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class ProductColor {
  final String name;
  final String hex;
  final List<String> images;

  ProductColor({required this.name, required this.hex, required this.images});

  factory ProductColor.fromJson(Map<String, dynamic> json) =>
      _$ProductColorFromJson(json);

  Map<String, dynamic> toJson() => _$ProductColorToJson(this);
}

@JsonSerializable()
class ShippingInfo {
  final String delivery;
  final String returns;

  ShippingInfo({required this.delivery, required this.returns});

  factory ShippingInfo.fromJson(Map<String, dynamic> json) =>
      _$ShippingInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingInfoToJson(this);
}

@JsonSerializable()
class Support {
  @JsonKey(name: 'contactEmail')
  final String contactEmail;
  @JsonKey(name: 'faqUrl')
  final String faqUrl;

  Support({required this.contactEmail, required this.faqUrl});

  factory Support.fromJson(Map<String, dynamic> json) =>
      _$SupportFromJson(json);

  Map<String, dynamic> toJson() => _$SupportToJson(this);
}

@JsonSerializable()
class ProductActions {
  @JsonKey(name: 'addToCart')
  final bool addToCart;
  @JsonKey(name: 'addToWishlist')
  final bool addToWishlist;
  final bool share;

  ProductActions({
    required this.addToCart,
    required this.addToWishlist,
    required this.share,
  });

  factory ProductActions.fromJson(Map<String, dynamic> json) =>
      _$ProductActionsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductActionsToJson(this);
}

@JsonSerializable()
class RelatedProduct {
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

  RelatedProduct({
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

  factory RelatedProduct.fromJson(Map<String, dynamic> json) =>
      _$RelatedProductFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedProductToJson(this);

  // Helper method to check if it's a sale item
  bool get isSaleItem => oldPrice != null;
}

