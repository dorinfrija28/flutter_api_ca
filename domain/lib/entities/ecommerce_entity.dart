class EcommerceEntity {
  final HeaderEntity header;
  final List<SectionEntity> sections;

  EcommerceEntity({required this.header, required this.sections});
}

class HeaderEntity {
  final String title;
  final String bannerImage;

  HeaderEntity({required this.title, required this.bannerImage});
}

class SectionEntity {
  final String title;
  final String subtitle;
  final List<SectionItemEntity> items;

  SectionEntity({
    required this.title,
    required this.subtitle,
    required this.items,
  });
}

class SectionItemEntity {
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
  final bool? isNew;
  final bool isFavorite;

  SectionItemEntity({
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

  bool get isSaleItem => oldPrice != null && newPrice != null;
  bool get isNewItem => isNew == true || price != null;
}
