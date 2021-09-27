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
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(widget.card.cardNumber,
                            style:
                                TextStyle(fontSize: 25, color: Colors.black45)),
                        Text(widget.card.category.backgroundColor,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    CircleAvatar(
                      radius: 35,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: TextField(
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.only(
                        left: 20,
                        top: 15,
                        right: 20,
                        bottom: 15,
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: CircleAvatar(
                          child: Icon(Icons.search),
                        ),
                      ),
                      hintText: "Pesquisar Amigos",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width - 80,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 20,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: CircleAvatar(
                                radius: 35,
                                backgroundColor:
                                    index == 0 ? Colors.white : Colors.blue,
                                child: CircleAvatar(
                                  radius: 33,
                                  backgroundColor: Colors.white,
                                  child: index == 0
                                      ? Icon(Icons.add)
                                      : Text("$index"),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  height: MediaQuery.of(context).size.height / 2.4,
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 3.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        color: Colors.blue[50],
                        height: MediaQuery.of(context).size.height / 7.7,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    // o texto fica alinhado do inicio
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // centraliza no meio da div o text
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "evenus fi",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "Data ",
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Icon(Icons.more_vert),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
