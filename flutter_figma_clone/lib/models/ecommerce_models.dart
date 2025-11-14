import 'package:json_annotation/json_annotation.dart';

part 'ecommerce_models.g.dart';

@JsonSerializable()
class EcommerceJson {
  final Header header;
  final List<Section> sections;

  EcommerceJson({required this.header, required this.sections});

  factory EcommerceJson.fromJson(Map<String, dynamic> json) =>
      _$EcommerceJsonFromJson(json);

  Map<String, dynamic> toJson() => _$EcommerceJsonToJson(this);
}

@JsonSerializable()
class Header {
  final String title;
  @JsonKey(name: 'bannerImage')
  final String bannerImage;

  Header({required this.title, required this.bannerImage});

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);

  Map<String, dynamic> toJson() => _$HeaderToJson(this);
}

@JsonSerializable()
class Section {
  final String title;
  final String subtitle;
  final List<SectionItem> items;

  Section({required this.title, required this.subtitle, required this.items});

  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);

  Map<String, dynamic> toJson() => _$SectionToJson(this);
}

@JsonSerializable()
class SectionItem {
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

  SectionItem({
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

  factory SectionItem.fromJson(Map<String, dynamic> json) =>
      _$SectionItemFromJson(json);

  Map<String, dynamic> toJson() => _$SectionItemToJson(this);

  // Helper method to check if item is a sale item
  bool get isSaleItem => oldPrice != null && newPrice != null;

  // Helper method to check if item is a new item
  bool get isNewItem => isNew == true || price != null;
}

