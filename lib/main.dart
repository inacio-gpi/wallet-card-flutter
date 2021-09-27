import 'package:flutter/material.dart';
import 'package:wallet_flutter_app/app_widget.dart';

import 'app_widget.dart';
import 'modules/splash/splash_page.dart';

void main() {
  runApp(AppFirebase());
}

class AppFirebase extends StatefulWidget {
  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 1),
    () => 'Data Loaded',
  );
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _calculation,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("first");
          return Material(
            child: Center(
              child: Text(
                "Erro ao Carregar",
                textDirection: TextDirection.ltr,
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          print("second");
          // return MaterialApp(home: SplashPage());
          return AppWidget();
        } else {
          print("terceiro");
          return MaterialApp(home: SplashPage());
          // return SplashPage();
        }
      },
    );
  }
}
