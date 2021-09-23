import 'package:flutter/material.dart';
import 'package:wallet_flutter_app/modules/home/home_page.dart';
import 'package:wallet_flutter_app/modules/splash/splash_page.dart';

import 'modules/card/card_page.dart';
import 'shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Flow',
      theme: ThemeData(primaryColor: AppColors.primary),
      initialRoute: "/home",
      routes: {
        "/home": (context) => HomePage(),
      },
      // initialRoute: "/splash",
      // routes: {
      //   "/splash": (context) => SplashPage(),
      //   "/home": (context) => HomePage(),
      // },
    );
  }
}
