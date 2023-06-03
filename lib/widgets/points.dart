import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/values.dart';

class Points extends StatefulWidget {
  const Points({super.key});

  @override
  State<Points> createState() => _PointsState();
}

class _PointsState extends State<Points> {
  BoxDecoration boxStyle = const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(8.0)));
  TextStyle textStyle = const TextStyle(
      fontSize: 20.0,
      color: Colors.black,
      decoration: TextDecoration.none); // da inserire

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width / 1.1,
            height: MediaQuery.of(context).size.height / 17,
            decoration: boxStyle,
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
            child: ValueListenableBuilder(
                valueListenable: Values.level,
                builder: (context, value, child) => AutoSizeText(
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      'Level: $value',
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              decoration: TextDecoration.none)),
                    ))),
        SizedBox(height: MediaQuery.of(context).size.height / 80),
        Container(
          width: MediaQuery.of(context).size.width / 1.1,
          height: MediaQuery.of(context).size.height / 17,
          decoration: boxStyle,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
          child: ValueListenableBuilder(
              valueListenable: Values.totCoins,
              builder: (context, value, child) => AutoSizeText(
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  'Total Coins: $value',
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          decoration: TextDecoration.none)))),
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 80),
        Container(
          decoration: boxStyle,
          width: MediaQuery.of(context).size.width / 1.1,
          height: MediaQuery.of(context).size.height / 17,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
          child: ValueListenableBuilder(
              valueListenable: Values.lvlCoins,
              builder: (context, value, child) => AutoSizeText(
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  'Coins collected in this Level: $value',
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          decoration: TextDecoration.none)))),
        ),
      ],
    ));
  }
}
