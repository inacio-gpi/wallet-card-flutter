import 'package:dartz/dartz.dart';

import '../../../../utils/error/failures.dart';
import '../entities/card_entity.dart';

abstract class ICardRepository {
  Future<Either<Failure, List<CardEntity>>> getCards();
  Future<Either<Failure, void>> saveCards(List<CardEntity> params);
}
