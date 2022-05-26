import 'package:flutter/material.dart';

class CardDetailOptionWidget extends StatelessWidget {
  final void Function()? onTap;
  final Color? color;
  final Icon icon;
  final String text;
  const CardDetailOptionWidget({
    Key? key,
    this.onTap,
    this.color = Colors.black,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 21,
            vertical: 8,
          ),
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
                  child: icon,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: color),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
