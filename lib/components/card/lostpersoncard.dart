import 'package:flutter/material.dart';

Widget buildLostCard(context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Container(
    width: width * 9 / 10,
    height: height * 1.5 / 10,
    child: Material(
      color: Color(0xffececec),
      elevation: 4,
      borderRadius: BorderRadius.circular(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: width * 2 / 10,
            height: height * 1.2 / 10,
            child: Material(
              color: Color(0xfffffdfd),
              elevation: 4,
              borderRadius: BorderRadius.circular(38),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Orhun Özdemir",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
              Text(
                "Kerhane",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
