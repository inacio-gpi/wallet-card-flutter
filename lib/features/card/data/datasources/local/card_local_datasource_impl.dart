import 'dart:convert';

import 'package:hive/hive.dart';

import '../../models/card_model.dart';
import '../i_card_local_datasource.dart';

class CardLocalDatasourceImpl implements ICardLocalDatasource {
  static const String CACHED_CARDS = 'CACHED_CARDS';
  static const String CACHED_GENDER = 'CACHED_GENDER';
  CardLocalDatasourceImpl(this._box);

  final Box _box;

  @override
  Future<void> cacheCards(List<CardModel> models) {
    return _box.put(
      CACHED_CARDS,
      json.encode(models.map((e) => e.toJson()).toList()),
    );
  }

  @override
  List<CardModel> getCards() {
    final modelsString = _box.get(CACHED_CARDS);
    return json
        .decode(modelsString)
        .map<CardModel>((e) => CardModel.fromJson(e))
        .toList();
  }
}
