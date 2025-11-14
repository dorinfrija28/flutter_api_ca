// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecommerce_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcommerceJson _$EcommerceJsonFromJson(Map<String, dynamic> json) =>
    EcommerceJson(
      header: Header.fromJson(json['header'] as Map<String, dynamic>),
      sections: (json['sections'] as List<dynamic>)
          .map((e) => Section.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EcommerceJsonToJson(EcommerceJson instance) =>
    <String, dynamic>{'header': instance.header, 'sections': instance.sections};

Header _$HeaderFromJson(Map<String, dynamic> json) => Header(
  title: json['title'] as String,
  bannerImage: json['bannerImage'] as String,
);

Map<String, dynamic> _$HeaderToJson(Header instance) => <String, dynamic>{
  'title': instance.title,
  'bannerImage': instance.bannerImage,
};

Section _$SectionFromJson(Map<String, dynamic> json) => Section(
  title: json['title'] as String,
  subtitle: json['subtitle'] as String,
  items: (json['items'] as List<dynamic>)
      .map((e) => SectionItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SectionToJson(Section instance) => <String, dynamic>{
  'title': instance.title,
  'subtitle': instance.subtitle,
  'items': instance.items,
};

SectionItem _$SectionItemFromJson(Map<String, dynamic> json) => SectionItem(
  id: (json['id'] as num).toInt(),
  brand: json['brand'] as String,
  name: json['name'] as String,
  image: json['image'] as String,
  oldPrice: (json['oldPrice'] as num?)?.toDouble(),
  newPrice: (json['newPrice'] as num?)?.toDouble(),
  price: (json['price'] as num?)?.toDouble(),
  discount: (json['discount'] as num?)?.toInt(),
  rating: (json['rating'] as num).toDouble(),
  reviews: (json['reviews'] as num).toInt(),
  isNew: json['isNew'] as bool?,
  isFavorite: json['isFavorite'] as bool,
);

Map<String, dynamic> _$SectionItemToJson(SectionItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'name': instance.name,
      'image': instance.image,
      'oldPrice': instance.oldPrice,
      'newPrice': instance.newPrice,
      'price': instance.price,
      'discount': instance.discount,
      'rating': instance.rating,
      'reviews': instance.reviews,
      'isNew': instance.isNew,
      'isFavorite': instance.isFavorite,
    };
