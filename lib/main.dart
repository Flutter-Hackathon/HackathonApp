import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackathonapp/provider/depremler.dart';
import 'package:hackathonapp/screens/Homepage.dart';
import 'package:hackathonapp/screens/NavBar.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Depremler(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavBar(),
      ),
    );
  }
}
