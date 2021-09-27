import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallet_flutter_app/modules/card/card_page.dart';
import 'package:wallet_flutter_app/shared/models/card_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CardModel> cards = [];

  getUserData() async {
    var response = await http.get(
      Uri.parse(
        "https://raw.githubusercontent.com/policante/Coopercard-mobile/master/service/cards.json",
      ),
    );

    var jsonData = jsonDecode(response.body);
    for (var u in jsonData["cards"]) {
      CategoryModel category = CategoryModel(
        u["category"]['type'],
        u["category"]['background_color'],
        u["category"]['image_path'],
      );

      CardModel card = CardModel(
        u['name'],
        u['card_number'],
        u['limit'].toString(),
        category,
      );

      cards.add(card);
    }
    print(cards.length);
    return cards;
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // bottom: false,
        child: FutureBuilder(
          future: getUserData(),
          builder: (context, snapshot) {
            return Column(
              children: [
                const SizedBox(height: 30),
                ElevatedButton(
                  // style: ElevatedButton.styleFrom(
                  //   textStyle: const TextStyle(fontSize: 30),
                  // ),

                  onPressed: () {},
                  child: const Text('Enabled'),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cards.length,
                    itemBuilder: (context, i) {
                      var colorbg =
                          cards[i].category.backgroundColor.replaceAll("#", "");
                      return
                          //  Card(
                          //   elevation: 5,
                          //   child: InkWell(
                          //     onTap: () {
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) => CardPage(card: cards[i]),
                          //         ),
                          //       );
                          //     },
                          //     child: Row(
                          //       // mainAxisAlignment: MainAxisAlignment.start,
                          //       children: [
                          //         Column(
                          //           children: [
                          //             Container(
                          //               padding: EdgeInsets.symmetric(horizontal: 10),
                          //               width: 120,
                          //               height: 170,
                          //               // decoration: BoxDecoration(
                          //               //   borderRadius: BorderRadius.horizontal(
                          //               //     left: Radius.circular(20),
                          //               //   ),
                          //               // ),
                          //               color: Color(int.parse("0xFF$colorbg")),
                          //               child: Center(
                          //                 // padding: EdgeInsets.symmetric(horizontal: 20),
                          //                 // width: 120,
                          //                 // height: 80,
                          //                 child: Card(
                          //                   child: Padding(
                          //                     padding: EdgeInsets.symmetric(
                          //                       horizontal: 5,
                          //                       vertical: 10,
                          //                     ),
                          //                     child: Image.network(
                          //                       // padding: EdgeInsets.symmetric(horizontal: 20),

                          //                       cards[i].category.imagePath,
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //         Column(
                          //           mainAxisAlignment: MainAxisAlignment.start,
                          //           crossAxisAlignment: CrossAxisAlignment.start,
                          //           children: [
                          //             Column(
                          //               crossAxisAlignment: CrossAxisAlignment.start,
                          //               children: [
                          //                 Text("Ola"),
                          //                 Text("Mundo"),
                          //               ],
                          //             )
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // );

                          Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 10, right: 10),

                        //   child: InkWell(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CardPage(card: cards[i]),
                              ),
                            );
                          },
                          child: IntrinsicHeight(
                            child: Container(
                              decoration: new BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius:
                                        10.0, // has the effect of softening the shadow
                                    spreadRadius:
                                        0.4, // has the effect of extending the shadow
                                    offset: Offset(
                                      0.0, // horizontal, move right 10
                                      0.0, // vertical, move down 10
                                    ),
                                  )
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      // width: 80,
                                      // height: 170,
                                      decoration: BoxDecoration(
                                        color: Color(int.parse("0xFF$colorbg")),
                                        borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(10),
                                        ),
                                      ),
                                      child: Center(
                                        // padding: EdgeInsets.symmetric(horizontal: 20),
                                        // width: 120,
                                        // height: 80,
                                        child: Card(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 5,
                                              vertical: 10,
                                            ),
                                            child: Image.network(
                                              cards[i].category.imagePath,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 9,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 120.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("APELIDO"),
                                                    Text(
                                                      cards[i].name,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      "**** ${cards[i].cardNumber}",
                                                      style: TextStyle(
                                                        color: Color(
                                                          int.parse(
                                                              "0xFF$colorbg"),
                                                        ),
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        height: 2.1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "LIMITE",
                                                    ),
                                                    Text(
                                                      "R\$${cards[i].limit}",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
