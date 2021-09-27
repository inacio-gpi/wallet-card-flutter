import 'package:flutter/material.dart';
import 'package:wallet_flutter_app/shared/models/card_model.dart';
import 'package:wallet_flutter_app/shared/themes/app_colors.dart';
import 'package:wallet_flutter_app/shared/themes/app_text_styles.dart';
import 'package:flutter/foundation.dart';

class CardPage extends StatefulWidget {
  CardPage({Key? key, required this.card}) : super(key: key);

  final CardModel card;
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Image.network(widget.card.category.imagePath),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "APELIDO",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black45),
                              ),
                              Text(
                                widget.card.name,
                                style: TextStyle(
                                  height: 1.8,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "FINAL DO CARTÃO",
                                style: TextStyle(
                                  height: 1.8,
                                  fontSize: 14,
                                  color: Colors.black45,
                                ),
                              ),
                              Text(
                                widget.card.cardNumber,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "LIMITE",
                                style: TextStyle(
                                  height: 1.8,
                                  fontSize: 14,
                                  color: Colors.black45,
                                ),
                              ),
                              Text(
                                "R\$${widget.card.limit}",
                                style: TextStyle(
                                  height: 1.8,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 21, vertical: 8),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0x33000000),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.lock_open_rounded,
                                  size: 30,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "ALTERAR\nSENHA",
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 21, vertical: 8),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0x33000000),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.mode_edit,
                                  size: 30,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "ALTERAR\nAPELIDO",
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 21, vertical: 8),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0x33000000),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.delete_outline,
                                  size: 30,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "REMOVER\nCARTÃO",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
