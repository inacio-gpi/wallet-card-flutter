import 'package:flutter/material.dart';
import 'package:wallet_flutter_app/shared/themes/app_colors.dart';
import 'package:wallet_flutter_app/shared/themes/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Center(child: Image.asset(AppImages.union)),
          Positioned(
            top: 100,
            left: 50,
            child: Image.asset(AppImages.logoFull),
          ),
          Positioned(
            top: 200,
            left: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              // all(Radius.circular(50)),
              child: Container(
                height: 180,
                width: 250,
                color: Color(0x80cc1515),
              ),
            ),
          )
        ],
      ),
    );
  }
}
