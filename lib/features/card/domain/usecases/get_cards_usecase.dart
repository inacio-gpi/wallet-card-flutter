import 'package:dartz/dartz.dart';

import '../../../../utils/error/failures.dart';
import '../../../../utils/usecase/usecase.dart';
import '../entities/card_entity.dart';
import '../repositories/i_card_repository.dart';

class GetCardsUseCase extends UseCase<List<CardEntity>, NoParams> {
  GetCardsUseCase(this.repository);

  final ICardRepository repository;

  @override
  Future<Either<Failure, List<CardEntity>>> call(NoParams param) {
    return repository.getCards();
  }
}
