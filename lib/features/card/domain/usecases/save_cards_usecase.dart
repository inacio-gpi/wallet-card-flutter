import 'package:dartz/dartz.dart';

import '../../../../utils/error/failures.dart';
import '../../../../utils/usecase/usecase.dart';
import '../entities/card_entity.dart';
import '../repositories/i_card_repository.dart';

class SaveCardsUseCase extends UseCase<void, List<CardEntity>> {
  SaveCardsUseCase(this.repository);

  final ICardRepository repository;

  @override
  Future<Either<Failure, void>> call(List<CardEntity> params) {
    final result = repository.saveCards(params);
    return result;
  }
}
