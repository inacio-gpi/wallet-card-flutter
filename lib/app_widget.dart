import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wallet_flutter_app/utils/context_util.dart';

import 'utils/keyboard/keyboard_util.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null &&
              FocusManager.instance.primaryFocus != null) {
            FocusManager.instance.primaryFocus!.unfocus();
            KeyboardUtil().unsetActions();
          }
        },
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
          localizationsDelegates: const [
            // GlobalMaterialLocalizations.delegate,
            // GlobalWidgetsLocalizations.delegate,
            // GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale('pt_BR', ''),
          ],
          // title: dotenv.get('APP_NAME', fallback: 'Ambiente não configurado.'),
          // theme: Modular.get<ThemeBase>()
          //     .getThemeData(), //ThemeData(primarySwatch: Colors.blue),
          scaffoldMessengerKey: ContextUtil().snackbarKey,
        ),
      ),
    );
  }
}
