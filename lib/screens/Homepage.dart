import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hackathonapp/components/card/lostpersoncard.dart';
import 'package:hackathonapp/components/card/member.dart';
import 'package:hackathonapp/components/textfield/textwitgetwithpadding.dart';
import 'package:hackathonapp/model/deprem.dart';
import 'package:hackathonapp/provider/depremler.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Depremler depremler = Provider.of<Depremler>(context);
    return Scaffold(
      body: StreamBuilder(
        stream: depremler.getDepremler(
          Duration(seconds: 1),
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DepremCounter(snapshot.data);
          } else
            return CircularProgressIndicator();
        },
      ),
    );
  }
}

class DepremCounter extends StatelessWidget {
  final Deprem _deprem;

  DepremCounter(this._deprem);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        (Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height * 3 / 10,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.withOpacity(0.02), width: 5),
          ),
          child: ListView.builder(
            itemCount: _deprem.result.length,
            itemBuilder: (context, index) {
              return Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.35 / 10,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 25),
                        child: Text(
                          "${_deprem.result[index].title}",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 25),
                        child: Text("${_deprem.result[index].mag}"),
                      )
                    ],
                  ));
            },
          ),
        )),
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
