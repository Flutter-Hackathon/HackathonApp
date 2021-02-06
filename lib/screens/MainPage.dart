import 'package:flutter/material.dart';
import 'package:hackathonapp/components/card/lostpersoncard.dart';
import 'package:hackathonapp/components/card/member.dart';
import 'package:hackathonapp/components/textfield/textwitgetwithpadding.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 3 / 10,
                width: MediaQuery.of(context).size.width * 8.9 / 10,
                decoration: BoxDecoration(
                    color: Colors.green[700],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Column(
                  children: [
                    buildTextWidgetWithPadding(
                        "Son Depremler", 20, Colors.white, FontWeight.bold,
                        padding: 25)
                  ],
                )),
          ],
        ),
        buildTextWidgetWithPadding(
            "Yakınların", 20, Colors.black, FontWeight.bold,
            padding: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            memberCard("Onur", context),
            memberCard("Taha", context),
            memberCard("Orhun", context),
          ],
        ),
        buildTextWidgetWithPadding(
            "Son Kayıp İlanı", 20, Colors.black, FontWeight.bold,
            padding: 25),
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: buildLostCard(context),
        )
      ],
    );
  }
}
