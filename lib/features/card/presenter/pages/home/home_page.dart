import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../card_module.dart';
import '../../../domain/entities/card_entity.dart';
import '../../widgets/card_widget.dart';
import '../detail/detail_page.dart';
import 'get_cards_controller.dart';
import 'save_cards_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final getCardController = Modular.get<GetCardsController>();
  final saveCardController = Modular.get<SaveCardsController>();
  final CardEntity newCardEntity = CardEntity(
    name: 'Teste',
    cardNumber: '123456789',
    limit: '100',
    category: CategoryEntity(
      type: 'Teste',
      backgroundColor: '#358752',
      imagePath:
          'https://www.coopercard.com.br/Portal/Static/Imagem/Cards/17052022_14_mockup_COM_home.png',
    ),
  );

  @override
  void initState() {
    getCardController.getCard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                textStyle: const TextStyle(fontSize: 22),
              ),
              onPressed: () async {
                bool result = await saveCardController.saveCard(
                  [newCardEntity, ...getCardController.value],
                );
                if (result) {
                  getCardController.getCard();
                }
              },
              child: const Text('adicionar cartão'),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: getCardController,
              builder: (context, List<CardEntity> listCard, Widget? child) {
                return ListView.builder(
                  itemCount: listCard.length,
                  itemBuilder: (context, i) {
                    final card = listCard[i];
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                        left: 10,
                        right: 10,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Modular.to.pushNamed(
                            CardModule.moduleRoute + DetailPage.pageRoute,
                            arguments: card,
                          );
                        },
                        child: CardWidget(card: card),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
