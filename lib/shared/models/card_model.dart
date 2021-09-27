// import 'dart:convert';

class CardModel {
  final String name, cardNumber, limit;
  final CategoryModel category;
  CardModel(this.name, this.cardNumber, this.limit, this.category);
  // CardModel(this.name, this.cardNumber, this.limit);

  // factory CardModel.fromMap(Map<String, dynamic> map) {
  //   return CardModel(name: map['name'], photoURL: map['photoURL']);
  // }

  // factory CardModel.fromJson(String json) =>
  //     CardModel.fromMap(jsonDecode(json));

  // Map<String, dynamic> toMap() => {
  //       "name": name,
  //       "photoURL": photoURL,
  //     };

  // String toJson() => jsonEncode(toMap());
}

class CategoryModel {
  final String type, backgroundColor, imagePath;
  CategoryModel(this.type, this.backgroundColor, this.imagePath);
}
