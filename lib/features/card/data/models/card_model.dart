import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../domain/entities/card_entity.dart';

class CardModel extends Equatable {
  final String name;
  final String cardNumber;
  final String limit;
  final CategoryModel category;
  CardModel({
    required this.name,
    required this.cardNumber,
    required this.limit,
    required this.category,
  });

  @override
  List<Object?> get props => [name, cardNumber, limit, category];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cardNumber': cardNumber,
      'limit': limit,
      'category': category.toMap(),
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      name: map['name'] ?? '',
      cardNumber: map['cardNumber'] ?? '',
      limit: map['limit'] ?? '',
      category: CategoryModel.fromMap(map['category']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CardModel.fromJson(String source) =>
      CardModel.fromMap(json.decode(source));
}

extension CardModelX on CardModel {
  CardEntity toEntity() => CardEntity(
        cardNumber: cardNumber,
        category: category.toEntity(),
        limit: limit,
        name: name,
      );
}

class CategoryModel extends Equatable {
  final String type;
  final String backgroundColor;
  final String imagePath;
  CategoryModel({
    required this.type,
    required this.backgroundColor,
    required this.imagePath,
  });
  @override
  List<Object?> get props => [type, backgroundColor, imagePath];

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'backgroundColor': backgroundColor,
      'imagePath': imagePath,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      type: map['type'] ?? '',
      backgroundColor: map['backgroundColor'] ?? '',
      imagePath: map['imagePath'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));
}

extension CategoryModelX on CategoryModel {
  CategoryEntity toEntity() => CategoryEntity(
        backgroundColor: backgroundColor,
        imagePath: imagePath,
        type: type,
      );
}
