import '../../../domain/entities/card_entity.dart';
import '../../../domain/usecases/save_cards_usecase.dart';

class SaveCardsController {
  final SaveCardsUseCase _useCase;

  SaveCardsController(this._useCase);

  Future<bool> saveCard(List<CardEntity> listCards) async {
    final result = await _useCase(listCards);
    return result.fold(
      (l) {
        return false;
      },
      (r) {
        return true;
      },
    );
  }
}
