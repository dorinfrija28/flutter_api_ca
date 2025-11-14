import 'package:domain/entities/product_entity.dart';
import '../dto/product_dto.dart';
import '../utils/image_url_resolver.dart';

class ProductMapper {
  static ProductDetailsEntity toEntity(ProductDetailsDto dto) {
    return ProductDetailsEntity(
      product: ProductEntityMapper.toEntity(dto.product),
      relatedProducts: dto.relatedProducts
          .map((product) => RelatedProductMapper.toEntity(product))
          .toList(),
    );
  }
}

class ProductEntityMapper {
  static ProductEntity toEntity(ProductDto dto) {
    return ProductEntity(
      id: dto.id,
      title: dto.title,
      brand: dto.brand,
      description: dto.description,
      price: dto.price,
      currency: dto.currency,
      rating: dto.rating,
      reviewsCount: dto.reviewsCount,
      colors: dto.colors
          .map((color) => ProductColorMapper.toEntity(color))
          .toList(),
      sizes: dto.sizes,
      shippingInfo: ShippingInfoMapper.toEntity(dto.shippingInfo),
      support: SupportMapper.toEntity(dto.support),
      actions: ProductActionsMapper.toEntity(dto.actions),
    );
  }
}

class ProductColorMapper {
  static ProductColorEntity toEntity(ProductColorDto dto) {
    return ProductColorEntity(
      name: dto.name,
      hex: dto.hex,
      images: ImageUrlResolver.resolveList(dto.images),
    );
  }
}

class ShippingInfoMapper {
  static ShippingInfoEntity toEntity(ShippingInfoDto dto) {
    return ShippingInfoEntity(delivery: dto.delivery, returns: dto.returns);
  }
}

class SupportMapper {
  static SupportEntity toEntity(SupportDto dto) {
    return SupportEntity(contactEmail: dto.contactEmail, faqUrl: dto.faqUrl);
  }
}

class ProductActionsMapper {
  static ProductActionsEntity toEntity(ProductActionsDto dto) {
    return ProductActionsEntity(
      addToCart: dto.addToCart,
      addToWishlist: dto.addToWishlist,
      share: dto.share,
    );
  }
}

class RelatedProductMapper {
  static RelatedProductEntity toEntity(RelatedProductDto dto) {
    return RelatedProductEntity(
      id: dto.id,
      title: dto.title,
      brand: dto.brand,
      price: dto.price,
      oldPrice: dto.oldPrice,
      currency: dto.currency,
      discount: dto.discount,
      rating: dto.rating,
      reviewsCount: dto.reviewsCount,
      image: ImageUrlResolver.resolve(dto.image),
    );
  }
}
