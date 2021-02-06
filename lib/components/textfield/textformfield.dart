import 'package:flutter/material.dart';

class TextFormFieldWidget {
  bool _isHidden = true;
  String email;
  String password;
  String name;
  String phone;
  TextFormField buildTextFormField(String labelText) {
    return TextFormField(
      validator: (value) {
        return validatorEmailandPassword(labelText, value);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 20.0,
        ),
        suffixIcon: labelText == "Password"
            ? FlatButton(
                onPressed: () {},
                child: Text("Forgot Password ?"),
                textColor: Colors.blue,
              )
            : null,
      ),
      obscureText: labelText == "Password" ? _isHidden : false,
      keyboardType: keyboardType(labelText),
      onChanged: (value) {
        if (labelText == "Password") {
          password = value.trim();
          print("sifre" + password);
        } else if (labelText == "Email address") {
          email = value.trim();
          print("email" + email);
        } else if (labelText == "Name") {
          name = value.trim();
          print("name" + name);
        } else if (labelText == "Telephone") {
          phone = value.trim();
          print("phone" + phone);
        }
      },
    );
  }

  TextInputType keyboardType(String labelText) {
    if (labelText == "Email address") {
      return TextInputType.emailAddress;
    } else if (labelText == "Password") {
      return TextInputType.text;
    } else if (labelText == "Name") {
      return TextInputType.name;
    } else if (labelText == "Telephone") {
      return TextInputType.phone;
    }
  }

  String validatorEmailandPassword(String labelText, String value) {
    if (labelText == "Email address") {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(value))
        return 'Enter Valid Email';
      else
        return null;
    } else if (labelText == "Password") {
      if (value.length < 8) {
        return 'The password must be 8 characters or more.';
      } else {
        return null;
      }
    }
  }
}
