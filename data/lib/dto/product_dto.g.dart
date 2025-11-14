// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsDto _$ProductDetailsDtoFromJson(Map<String, dynamic> json) =>
    ProductDetailsDto(
      product: ProductDto.fromJson(json['product'] as Map<String, dynamic>),
      relatedProducts: (json['relatedProducts'] as List<dynamic>)
          .map((e) => RelatedProductDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDetailsDtoToJson(ProductDetailsDto instance) =>
    <String, dynamic>{
      'product': instance.product,
      'relatedProducts': instance.relatedProducts,
    };

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => ProductDto(
  id: json['id'] as String,
  title: json['title'] as String,
  brand: json['brand'] as String,
  description: json['description'] as String,
  price: (json['price'] as num).toDouble(),
  currency: json['currency'] as String,
  rating: (json['rating'] as num).toDouble(),
  reviewsCount: (json['reviewsCount'] as num).toInt(),
  colors: (json['colors'] as List<dynamic>)
      .map((e) => ProductColorDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  sizes: (json['sizes'] as List<dynamic>).map((e) => e as String).toList(),
  shippingInfo: ShippingInfoDto.fromJson(
    json['shippingInfo'] as Map<String, dynamic>,
  ),
  support: SupportDto.fromJson(json['support'] as Map<String, dynamic>),
  actions: ProductActionsDto.fromJson(json['actions'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'brand': instance.brand,
      'description': instance.description,
      'price': instance.price,
      'currency': instance.currency,
      'rating': instance.rating,
      'reviewsCount': instance.reviewsCount,
      'colors': instance.colors,
      'sizes': instance.sizes,
      'shippingInfo': instance.shippingInfo,
      'support': instance.support,
      'actions': instance.actions,
    };

ProductColorDto _$ProductColorDtoFromJson(Map<String, dynamic> json) =>
    ProductColorDto(
      name: json['name'] as String,
      hex: json['hex'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ProductColorDtoToJson(ProductColorDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'hex': instance.hex,
      'images': instance.images,
    };

ShippingInfoDto _$ShippingInfoDtoFromJson(Map<String, dynamic> json) =>
    ShippingInfoDto(
      delivery: json['delivery'] as String,
      returns: json['returns'] as String,
    );

Map<String, dynamic> _$ShippingInfoDtoToJson(ShippingInfoDto instance) =>
    <String, dynamic>{
      'delivery': instance.delivery,
      'returns': instance.returns,
    };

SupportDto _$SupportDtoFromJson(Map<String, dynamic> json) => SupportDto(
  contactEmail: json['contactEmail'] as String,
  faqUrl: json['faqUrl'] as String,
);

Map<String, dynamic> _$SupportDtoToJson(SupportDto instance) =>
    <String, dynamic>{
      'contactEmail': instance.contactEmail,
      'faqUrl': instance.faqUrl,
    };

ProductActionsDto _$ProductActionsDtoFromJson(Map<String, dynamic> json) =>
    ProductActionsDto(
      addToCart: json['addToCart'] as bool,
      addToWishlist: json['addToWishlist'] as bool,
      share: json['share'] as bool,
    );

Map<String, dynamic> _$ProductActionsDtoToJson(ProductActionsDto instance) =>
    <String, dynamic>{
      'addToCart': instance.addToCart,
      'addToWishlist': instance.addToWishlist,
      'share': instance.share,
    };

RelatedProductDto _$RelatedProductDtoFromJson(Map<String, dynamic> json) =>
    RelatedProductDto(
      id: json['id'] as String,
      title: json['title'] as String,
      brand: json['brand'] as String,
      price: (json['price'] as num).toDouble(),
      oldPrice: (json['oldPrice'] as num?)?.toDouble(),
      currency: json['currency'] as String,
      discount: json['discount'] as String?,
      rating: (json['rating'] as num).toDouble(),
      reviewsCount: (json['reviewsCount'] as num).toInt(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$RelatedProductDtoToJson(RelatedProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'brand': instance.brand,
      'price': instance.price,
      'oldPrice': instance.oldPrice,
      'currency': instance.currency,
      'discount': instance.discount,
      'rating': instance.rating,
      'reviewsCount': instance.reviewsCount,
      'image': instance.image,
    };
