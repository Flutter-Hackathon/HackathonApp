import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidgetWithPadding {
  Padding buildTextWidgetWithPadding(
      String txt, double size, Color renk, FontWeight tur,
      {double padding = 0, TextAlign align}) {
    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: Text(
        txt,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: renk,
            fontSize: size,
            fontWeight: tur,
          ),
        ),
        textAlign: align,
      ),
    );
  }
}
