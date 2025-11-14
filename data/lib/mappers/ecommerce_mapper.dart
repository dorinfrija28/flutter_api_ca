import 'package:domain/entities/ecommerce_entity.dart';
import '../dto/ecommerce_dto.dart';
import '../utils/image_url_resolver.dart';

class EcommerceMapper {
  static EcommerceEntity toEntity(EcommerceDto dto) {
    return EcommerceEntity(
      header: HeaderMapper.toEntity(dto.header),
      sections: dto.sections
          .map((section) => SectionMapper.toEntity(section))
          .toList(),
    );
  }
}

class HeaderMapper {
  static HeaderEntity toEntity(HeaderDto dto) {
    return HeaderEntity(
      title: dto.title,
      bannerImage: ImageUrlResolver.resolve(dto.bannerImage),
    );
  }
}

class SectionMapper {
  static SectionEntity toEntity(SectionDto dto) {
    return SectionEntity(
      title: dto.title,
      subtitle: dto.subtitle,
      items: dto.items.map((item) => SectionItemMapper.toEntity(item)).toList(),
    );
  }
}

class SectionItemMapper {
  static SectionItemEntity toEntity(SectionItemDto dto) {
    return SectionItemEntity(
      id: dto.id,
      brand: dto.brand,
      name: dto.name,
      image: ImageUrlResolver.resolve(dto.image),
      oldPrice: dto.oldPrice,
      newPrice: dto.newPrice,
      price: dto.price,
      discount: dto.discount,
      rating: dto.rating,
      reviews: dto.reviews,
      isNew: dto.isNew,
      isFavorite: dto.isFavorite,
    );
  }
}
