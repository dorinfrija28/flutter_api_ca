class ProductDetailsEntity {
  final ProductEntity product;
  final List<RelatedProductEntity> relatedProducts;

  ProductDetailsEntity({required this.product, required this.relatedProducts});
}

class ProductEntity {
  final String id;
  final String title;
  final String brand;
  final String description;
  final double price;
  final String currency;
  final double rating;
  final int reviewsCount;
  final List<ProductColorEntity> colors;
  final List<String> sizes;
  final ShippingInfoEntity shippingInfo;
  final SupportEntity support;
  final ProductActionsEntity actions;

  ProductEntity({
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
}

class ProductColorEntity {
  final String name;
  final String hex;
  final List<String> images;

  ProductColorEntity({
    required this.name,
    required this.hex,
    required this.images,
  });
}

class ShippingInfoEntity {
  final String delivery;
  final String returns;

  ShippingInfoEntity({required this.delivery, required this.returns});
}

class SupportEntity {
  final String contactEmail;
  final String faqUrl;

  SupportEntity({required this.contactEmail, required this.faqUrl});
}

class ProductActionsEntity {
  final bool addToCart;
  final bool addToWishlist;
  final bool share;

  ProductActionsEntity({
    required this.addToCart,
    required this.addToWishlist,
    required this.share,
  });
}

class RelatedProductEntity {
  final String id;
  final String title;
  final String brand;
  final double price;
  final double? oldPrice;
  final String currency;
  final String? discount;
  final double rating;
  final int reviewsCount;
  final String image;

  RelatedProductEntity({
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

  bool get isSaleItem => oldPrice != null;
}
