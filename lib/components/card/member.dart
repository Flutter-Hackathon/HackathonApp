import 'package:flutter/material.dart';

Widget memberCard(String name, context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Container(
    width: width * 2.8 / 10,
    height: height * 1.8 / 10,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Color(0x3f000000),
          blurRadius: 4,
          offset: Offset(0, 4),
        ),
      ],
      borderRadius: BorderRadius.circular(28),
      color: Color(0xfff2f2f2),
    ),
    child: Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: width * 2.2 / 10,
              height: height * 1.4 / 10,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(28),
                color: Color(0xffc4c4c4),
                image: DecorationImage(
                    image: NetworkImage("https://picsum.photos/1000/1000"),
                    fit: BoxFit.fill),
              ),
            ),
          ),
        ),
        Positioned(
          left: width * 1 / 15,
          top: 3.33,
          child: Container(
            width: 59.29,
            height: 13.32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xfff4e6e6),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 59.29,
              height: 13.32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xffef1e1e),
              ),
            ),
          ),
        ),
        Positioned(
          left: 30.40,
          top: 5.71,
          child: SizedBox(
            width: 51.18,
            height: 9.04,
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
