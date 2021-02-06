import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hackathonapp/model/deprem.dart';
import 'package:hackathonapp/provider/depremler.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  BuildContext context;

  HomePage.fromnew(this.context);
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
                  margin: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
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
        Container(
          height: MediaQuery.of(context).size.height * 1.9 / 10,
          width: MediaQuery.of(context).size.width * 9 / 10,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(),
                width: MediaQuery.of(context).size.width * 2.5 / 10,
                height: MediaQuery.of(context).size.width * 2.5 / 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5), blurRadius: 1),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    child: Text("İsim Soyisim"),
                  ),
                  Container(
                    child: Text("Yer Bilgisi"),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
