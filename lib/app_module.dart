import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

import 'features/card/card_module.dart';
import 'features/splash/splash_page.dart';
import 'utils/dio/dio_base.dart';
import 'utils/dio/dio_client_impl.dart';
import 'utils/dio/i_dio_client.dart';
import 'utils/local/resister_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => DioBase.dio),
        Bind.factory<IDioClient>((i) => DioClientImpl(i())),
        AsyncBind<Box>((i) => RegisterModule().openBox),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => SplashPage(),
        ),
        ModuleRoute(
          CardModule.moduleRoute,
          module: CardModule(),
          guards: [HomeGuard()],
        ),
      ];
}

class HomeGuard extends RouteGuard {
  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    await Modular.isModuleReady<AppModule>();
    return true;
  }
}
