import 'package:flutter/material.dart';

import '../../../../../utils/usecase/usecase.dart';
import '../../../domain/entities/card_entity.dart';
import '../../../domain/usecases/get_cards_usecase.dart';

class GetCardsController extends ValueNotifier<List<CardEntity>> {
  final GetCardsUseCase _useCase;

  GetCardsController(this._useCase) : super([]);

  Future<void> getCard() async {
    final result = await _useCase(NoParams());
    return result.fold(
      (failure) => value = [],
      (cards) {
        // listCards.clear();
        value = [...cards];
      },
    );
  }
}
