import 'package:flutter/material.dart';
import 'package:wallet_flutter_app/shared/models/user_model.dart';
import 'package:wallet_flutter_app/shared/themes/app_colors.dart';
import 'package:wallet_flutter_app/shared/themes/app_text_styles.dart';
import 'package:flutter/foundation.dart';

class CardPage extends StatefulWidget {
  CardPage({Key? key, required this.user}) : super(key: key);

  final UserModel user;
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Row(
              children: [
                Text("Meus extratos " + widget.user.name,
                    style: TextStyles.titleBoldHeading),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Divider(
              color: AppColors.stroke,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            // child: BoletoListWidget(
            //   key: UniqueKey(),
            // ),
          )
        ],
      ),
    );
  }
}
