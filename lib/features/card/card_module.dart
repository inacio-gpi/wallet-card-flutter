import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/i_card_local_datasource.dart';
import 'data/datasources/local/card_local_datasource_impl.dart';
import 'data/repositories/card_repository_impl.dart';
import 'domain/repositories/i_card_repository.dart';
import 'domain/usecases/get_cards_usecase.dart';
import 'domain/usecases/save_cards_usecase.dart';
import 'presenter/pages/detail/detail_page.dart';
import 'presenter/pages/home/get_cards_controller.dart';
import 'presenter/pages/home/home_page.dart';
import 'presenter/pages/home/save_cards_controller.dart';

class CardModule extends Module {
  static const String moduleRoute = '/card';

  @override
  List<Bind> get binds => [
        Bind.factory<ICardLocalDatasource>(
          (i) => CardLocalDatasourceImpl(i()),
        ),
        Bind.factory<ICardRepository>((i) => CardRepositoryImpl(i())),
        Bind.factory((i) => GetCardsUseCase(i())),
        Bind.factory((i) => SaveCardsUseCase(i())),
        Bind.singleton((i) => GetCardsController(i())),
        Bind.singleton((i) => SaveCardsController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        //! paginas
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => HomePage(),
        ),
        ChildRoute(
          DetailPage.pageRoute,
          child: (_, args) => DetailPage(card: args.data),
        ),
      ];
}
