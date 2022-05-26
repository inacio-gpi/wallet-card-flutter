import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/entities/card_entity.dart';
import '../../widgets/card_detail_option_widget.dart';

class DetailPage extends StatefulWidget {
  static const String pageRoute = "/card_details";
  DetailPage({Key? key, required this.card}) : super(key: key);

  final CardEntity card;
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      title: Text('Detalhes do cartão'),
    );
  }

  Widget _getBody() {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 40, top: 50, right: 40, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
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
                                fontSize: 14,
                                color: Colors.black45,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              widget.card.name,
                              style: TextStyle(
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
                                fontSize: 14,
                                color: Colors.black45,
                              ),
                            ),
                            SizedBox(height: 8),
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
                                fontSize: 14,
                                color: Colors.black45,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "R\$${widget.card.limit}",
                              style: TextStyle(
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
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardDetailOptionWidget(
                      icon: Icon(
                        Icons.lock_open_rounded,
                        size: 30,
                      ),
                      text: "ALTERAR\nSENHA",
                      onTap: () {},
                    ),
                    CardDetailOptionWidget(
                      icon: Icon(
                        Icons.mode_edit,
                        size: 30,
                      ),
                      text: "ALTERAR\nAPELIDO",
                      onTap: () {},
                    ),
                    CardDetailOptionWidget(
                      icon: Icon(
                        Icons.delete_outline,
                        size: 30,
                        color: Colors.red,
                      ),
                      color: Colors.red,
                      text: "REMOVER\nCARTÃO",
                      onTap: () {
                        Modular.to.pop();
                      },
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
