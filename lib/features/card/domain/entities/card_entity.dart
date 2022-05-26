import '../../data/models/card_model.dart';

class CardEntity {
  final String name, cardNumber, limit;
  final CategoryEntity category;
  CardEntity({
    required this.name,
    required this.cardNumber,
    required this.limit,
    required this.category,
  });
}

extension CardEntityX on CardEntity {
  CardModel toModel() => CardModel(
        name: name,
        cardNumber: cardNumber,
        limit: limit,
        category: category.toModel(),
      );
}

class CategoryEntity {
  final String type, backgroundColor, imagePath;
  CategoryEntity({
    required this.type,
    required this.backgroundColor,
    required this.imagePath,
  });
}

extension CategoryModelX on CategoryEntity {
  CategoryModel toModel() => CategoryModel(
        type: type,
        backgroundColor: backgroundColor,
        imagePath: imagePath,
      );
}
