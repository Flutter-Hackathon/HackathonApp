import 'package:flutter/material.dart';
import 'package:hackathonapp/components/textfield/textformfield.dart';
import 'package:hackathonapp/components/textfield/textwitgetwithpadding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackathonapp/screens/Signin.dart';
import 'package:firebase_database/firebase_database.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key key}) : super(key: key);

  @override
  _SignupScreen createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen> {
  var formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  final store = FirebaseDatabase.instance.reference();
  TextFormFieldWidget txtForm = TextFormFieldWidget();
  final InputDecoration decoration = InputDecoration(
    border: OutlineInputBorder(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
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
                key: formKey,
                child: Column(
                  children: <Widget>[
                    txtForm.buildTextFormField("Email address"),
                    txtForm.buildTextFormField("Name"),
                    txtForm.buildTextFormField("Telephone"),
                    txtForm.buildTextFormField("Password"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: buildSingButtonButton(),
            )
          ],
        ),
      ),
    ));
  }

  Icon buildIcon() {
    return Icon(
      Icons.arrow_forward_ios,
      color: Colors.blueAccent,
    );
  }

  ButtonTheme buildSingButtonButton() {
    return ButtonTheme(
      height: 40,
      minWidth: 110,
      child: RaisedButton(
        onPressed: () {
          if (formKey.currentState.validate()) {
            try {
              auth
                  .createUserWithEmailAndPassword(
                      email: txtForm.email, password: txtForm.password)
                  .then((_) {
                store.child('users').child(auth.currentUser.uid).set({
                  'name': txtForm.name,
                  'phone': txtForm.phone,
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SigninScreen()));
              });
            } on FirebaseAuthException catch (e) {
              print(e.message);
            }
          } else {
            setState(() {});
          }
        },
        child: Text("Sign Up"),
        color: Colors.blue,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
