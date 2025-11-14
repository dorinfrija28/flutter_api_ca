// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsJson _$ProductDetailsJsonFromJson(Map<String, dynamic> json) =>
    ProductDetailsJson(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      relatedProducts: (json['relatedProducts'] as List<dynamic>)
          .map((e) => RelatedProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDetailsJsonToJson(ProductDetailsJson instance) =>
    <String, dynamic>{
      'product': instance.product,
      'relatedProducts': instance.relatedProducts,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: json['id'] as String,
  title: json['title'] as String,
  brand: json['brand'] as String,
  description: json['description'] as String,
  price: (json['price'] as num).toDouble(),
  currency: json['currency'] as String,
  rating: (json['rating'] as num).toDouble(),
  reviewsCount: (json['reviewsCount'] as num).toInt(),
  colors: (json['colors'] as List<dynamic>)
      .map((e) => ProductColor.fromJson(e as Map<String, dynamic>))
      .toList(),
  sizes: (json['sizes'] as List<dynamic>).map((e) => e as String).toList(),
  shippingInfo: ShippingInfo.fromJson(
    json['shippingInfo'] as Map<String, dynamic>,
  ),
  support: Support.fromJson(json['support'] as Map<String, dynamic>),
  actions: ProductActions.fromJson(json['actions'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
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

ProductColor _$ProductColorFromJson(Map<String, dynamic> json) => ProductColor(
  name: json['name'] as String,
  hex: json['hex'] as String,
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$ProductColorToJson(ProductColor instance) =>
    <String, dynamic>{
      'name': instance.name,
      'hex': instance.hex,
      'images': instance.images,
    };

ShippingInfo _$ShippingInfoFromJson(Map<String, dynamic> json) => ShippingInfo(
  delivery: json['delivery'] as String,
  returns: json['returns'] as String,
);

Map<String, dynamic> _$ShippingInfoToJson(ShippingInfo instance) =>
    <String, dynamic>{
      'delivery': instance.delivery,
      'returns': instance.returns,
    };

Support _$SupportFromJson(Map<String, dynamic> json) => Support(
  contactEmail: json['contactEmail'] as String,
  faqUrl: json['faqUrl'] as String,
);

Map<String, dynamic> _$SupportToJson(Support instance) => <String, dynamic>{
  'contactEmail': instance.contactEmail,
  'faqUrl': instance.faqUrl,
};

ProductActions _$ProductActionsFromJson(Map<String, dynamic> json) =>
    ProductActions(
      addToCart: json['addToCart'] as bool,
      addToWishlist: json['addToWishlist'] as bool,
      share: json['share'] as bool,
    );

Map<String, dynamic> _$ProductActionsToJson(ProductActions instance) =>
    <String, dynamic>{
      'addToCart': instance.addToCart,
      'addToWishlist': instance.addToWishlist,
      'share': instance.share,
    };

RelatedProduct _$RelatedProductFromJson(Map<String, dynamic> json) =>
    RelatedProduct(
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

Map<String, dynamic> _$RelatedProductToJson(RelatedProduct instance) =>
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
