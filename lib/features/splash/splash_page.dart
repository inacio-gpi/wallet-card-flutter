import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../card/card_module.dart';

class SplashPage extends StatefulWidget {
  static const String pageRoute = "/splash";
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {}).then((value) {
      Modular.to.pushReplacementNamed(CardModule.moduleRoute);
    });
  }

  bool loading = true;
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 0), () {}).then(
      (value) {
        setState(() {
          loading = false;
        });
      },
    );
    return Scaffold(
      backgroundColor: Color(0xFF0F0F0F),
      body: Stack(
        children: [
          Center(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              height: loading ? 100 : 150,
              child: Image.asset('assets/images/card_cooper.jpeg'),
            ),
          ),
          Center(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              height: loading ? 300 : 400,
              child: Image.asset('assets/images/union.png'),
            ),
          ),
        ],
      ),
    );
  }
}
