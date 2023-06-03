import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/values.dart';
import '../widgets/board.dart';
import '../widgets/points.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.title});
  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    ButtonStyle buttonStyle = ButtonStyle(
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Colors.white, width: 2))),
        textStyle: MaterialStatePropertyAll(
            GoogleFonts.lato(textStyle: const TextStyle(fontSize: 25))),
        foregroundColor: const MaterialStatePropertyAll(Colors.white),
        backgroundColor: MaterialStatePropertyAll(
            const Color.fromRGBO(14, 17, 17, 1).withOpacity(0.7)),
        elevation: const MaterialStatePropertyAll(30),
        padding: const MaterialStatePropertyAll(EdgeInsets.all(10.0)),
        fixedSize: MaterialStatePropertyAll(Size(width / 1.3, height / 2.4)));
    ButtonStyle tutorialButtonStyle = ButtonStyle(
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Colors.white, width: 2))),
        textStyle: MaterialStatePropertyAll(
            GoogleFonts.lato(textStyle: const TextStyle(fontSize: 35))),
        foregroundColor: const MaterialStatePropertyAll(Colors.white),
        backgroundColor: MaterialStatePropertyAll(
            const Color.fromRGBO(14, 17, 17, 1).withOpacity(0.7)),
        elevation: const MaterialStatePropertyAll(30),
        padding: const MaterialStatePropertyAll(EdgeInsets.all(10.0)),
        fixedSize: MaterialStatePropertyAll(Size(width, height / 1.6)));

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: const Color.fromRGBO(14, 17, 17, 1),
        ),
        body: Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 35, 87, 37)),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                child: Stack(
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Points(),
                          SizedBox(
                            height: height / 50,
                          ),
                          const Board(),
                        ]),
                    Align(
                      child: ValueListenableBuilder(
                        valueListenable: Values.tutorial,
                        builder: (context, value, child) {
                          if (value && Values.status.value == 0) {
                            return ElevatedButton(
                                style: tutorialButtonStyle,
                                onPressed: () => Values.tutorial.value = false,
                                child: const AutoSizeText(
                                    style: TextStyle(wordSpacing: 4.0),
                                    "Flipping a multiplier card will give the player that many coins on the first card, or multiply the total by the number flipped for all subsequent flips. \nHigher levels have more multiplier cards, therefore producing larger payouts. \nFlipping a Voltorb ends the game. \nC & V stands for Coins and Voltorbs in that row/column."));
                          } else {
                            return const SizedBox(height: 0);
                          }
                        },
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: ValueListenableBuilder(
                          valueListenable: Values.status,
                          builder: (context, value, child) {
                            if (value == 1 || value == 2) {
                              return ElevatedButton(
                                  style: buttonStyle,
                                  onPressed: () {
                                    Values.status.value = 4;
                                  },
                                  child: value == 1
                                      ? Text(Values.lossMsg(),
                                          textAlign: TextAlign.center)
                                      : Text(
                                          Values.winMsg(),
                                          textAlign: TextAlign.center,
                                        ));
                            } else {
                              return const SizedBox(height: 0);
                            }
                          },
                        )),
                    Align(
                      alignment: Alignment.center,
                      child: ValueListenableBuilder(
                        valueListenable: Values.status,
                        builder: (context, value, child) {
                          if (value == 4) {
                            return SizedBox.expand(
                                child: TextButton(
                              onPressed: () => Values.reFlip(),
                              child: const Text(''),
                            ));
                          } else {
                            return const SizedBox(
                              height: 0,
                            );
                          }
                        },
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: ValueListenableBuilder(
                          valueListenable: Values.status,
                          builder: (context, value, child) {
                            if (value == 3) {
                              return ElevatedButton(
                                  style: buttonStyle,
                                  onPressed: () {
                                    Values.restart();
                                  },
                                  child: Text(
                                    Values.getLevelMsg(),
                                    textAlign: TextAlign.center,
                                  ));
                            } else {
                              return const SizedBox(height: 0);
                            }
                          },
                        ))
                  ],
                ))));
  }
}
