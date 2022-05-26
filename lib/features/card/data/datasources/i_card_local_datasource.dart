import '../models/card_model.dart';

abstract class ICardLocalDatasource {
  // Future<List<CardModel>> getCards();
  List<CardModel> getCards();
  Future<void> cacheCards(List<CardModel> models);
}
