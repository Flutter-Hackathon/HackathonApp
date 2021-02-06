import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hackathonapp/model/deprem.dart';
import 'package:hackathonapp/provider/depremler.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'WebSocket Demo';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: ChangeNotifierProvider(
        create: (context) => Depremler(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Depremler depremler = Provider.of<Depremler>(context, listen: true);
    return Scaffold(
      body: Center(
          child: StreamBuilder(
        stream: depremler.depremler(),
        initialData: "",
        builder: (context, stream) {
          if (stream.connectionState == ConnectionState.done) {
            return Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 20,
            );
          }
          if (stream.hasData) {
            return DepremCounter(stream.data);
          } else {
            return CircularProgressIndicator();
          }
        },
      )),
    );
  }
}

class DepremCounter extends StatelessWidget {
  final Deprem _deprem;

  DepremCounter(this._deprem);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _deprem.result.length,
        itemBuilder: (context, index) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 250),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.redAccent[200],
              // color: colors[index % colors.length],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  " ${_deprem.result[index].title} $index",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ],
            ),
          );
        });
  }
}
