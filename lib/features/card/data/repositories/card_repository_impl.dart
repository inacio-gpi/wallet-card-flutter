import 'package:dartz/dartz.dart';

import '../../../../utils/error/failures.dart';
import '../../domain/entities/card_entity.dart';
import '../../domain/repositories/i_card_repository.dart';
import '../datasources/i_card_local_datasource.dart';
import '../models/card_model.dart';

class CardRepositoryImpl implements ICardRepository {
  final ICardLocalDatasource datasource;

  CardRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<CardEntity>>> getCards() async {
    try {
      final list = await datasource.getCards();
      final List<CardEntity> result = list
          .map(
            (e) => e.toEntity(),
          )
          .toList()
          .cast<CardEntity>();
      return Right(result);
    } catch (e) {
      // return Left(DatasourceFailure(e.toString()));
      throw Exception;
    }
  }

  @override
  Future<Either<Failure, void>> saveCards(List<CardEntity> params) async {
    try {
      final result =
          await datasource.cacheCards(params.map((e) => e.toModel()).toList());
      return Right(result);
    } catch (e) {
      // return Left(DatasourceFailure(e.toString()));
      throw Exception;
    }
  }
}
