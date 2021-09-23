import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallet_flutter_app/modules/card/card_page.dart';
import 'package:wallet_flutter_app/shared/models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserModel> users = [];

  getUserData() async {
    // var response = await http.get(Uri.parse(
    //     "https://raw.githubusercontent.com/policante/Coopercard-mobile/master/service/cards.json"));
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    var jsonData = jsonDecode(response.body);

    for (var u in jsonData) {
      // print(u);

      UserModel user = UserModel(u['name'], u['email'], u['username']);

      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder(
        future: getUserData(),
        builder: (context, snapshot) {
          // if (snapshot != null) {
          return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, i) {
                return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://imagens.canaltech.com.br/empresas/690.400.jpg'),
                    ),
                    title: Text(users[i].name),
                    subtitle: Text(users[i].userName),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CardPage(user: users[i]),
                          ));
                    });
              });
        },
      ),
    ));
  }
}
