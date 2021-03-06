import 'package:flutter/material.dart';
import 'package:hackathonapp/components/textfield/textformfield.dart';
import 'package:hackathonapp/components/textfield/textwitgetwithpadding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackathonapp/screens/Signup.dart';
import 'package:hackathonapp/screens/NavBar.dart';

class SigninScreen extends StatefulWidget {
  SigninScreen({Key key}) : super(key: key);

  @override
  _SigninScreen createState() => _SigninScreen();
}

class _SigninScreen extends State<SigninScreen> {
  var formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  TextFormFieldWidget txtForm = TextFormFieldWidget();
  final InputDecoration decoration = InputDecoration(
    border: OutlineInputBorder(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildTextWidgetWithPadding(
                    "Welcome!", 40, Colors.black, FontWeight.w300,
                    padding: 20),
                buildTextWidgetWithPadding("Please Sing-in to Continue", 16,
                    Colors.black, FontWeight.normal),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        txtForm.buildTextFormField("Email address"),
                        txtForm.buildTextFormField("Password"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: buildSinginButtonButton("Sign In"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: buildSingupButtonButton("Sign Up"),
          ),
        ],
      ),
    ));
  }

  Icon buildIcon() {
    return Icon(
      Icons.arrow_forward_ios,
      color: Colors.blueAccent,
    );
  }

  ButtonTheme buildSinginButtonButton(String btntxt) {
    return ButtonTheme(
      height: 40,
      minWidth: 160,
      child: RaisedButton(
        onPressed: () {
          if (formKey.currentState.validate()) {
            signIn();
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => WelcomeScreen()));
          } else {
            setState(() {});
          }
        },
        child: Text(btntxt),
        color: Colors.blue,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }

  Future<void> signIn() async {
    try {
      await auth
          .signInWithEmailAndPassword(
              email: txtForm.email, password: txtForm.password)
          .then((_) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NavBar()));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password") {
        _showDialog(context, "Şifreniz yanlış yeniden deneyiniz.");
      } else if (e.code == "user-not-found") {
        _showDialog(context, "Böyle bir kullanıcı bulunamadı.");
      }
      print(e.code);
    }
  }

  Future _showDialog(BuildContext context, String message) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Hata"),
            content: Text(message),
            actions: [
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
              )
            ],
          );
        });
  }

  ButtonTheme buildSingupButtonButton(String btntxt) {
    return ButtonTheme(
      height: 40,
      minWidth: 160,
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignupScreen()));
        },
        child: Text(btntxt),
        color: Colors.blue,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
