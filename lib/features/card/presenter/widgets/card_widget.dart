import 'package:flutter/material.dart';

import '../../domain/entities/card_entity.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.card,
  }) : super(key: key);

  final CardEntity card;

  @override
  Widget build(BuildContext context) {
    var colorbg = card.category.backgroundColor.replaceAll("#", "");

    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 10,
      child: SizedBox(
        height: 170,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: Color(
                    int.parse("0xFF$colorbg"),
                  ),
                ),
                child: Center(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 10,
                      ),
                      child: Image.network(
                        // 'https://picsum.photos/200/300',
                        card.category.imagePath,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20.0,
                            left: 20.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("APELIDO"),
                              Text(
                                card.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "**** ${card.cardNumber}",
                                style: TextStyle(
                                  color: Color(
                                    int.parse("0xFF$colorbg"),
                                  ),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  height: 2.1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SizedBox.shrink(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 15.0,
                            bottom: 15.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "LIMITE",
                              ),
                              Text(
                                "R\$${card.limit}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
