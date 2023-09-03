// ignore_for_file: unused_local_variable

import 'package:animated_card/animated_card.dart';
import 'package:blackjack/Home/card_widget.dart';
import 'package:blackjack/Home/dealerCard.dart';
import 'package:blackjack/Home/homescreen.dart';
import 'package:blackjack/const/blackjack_game.dart';
import 'package:blackjack/const/class_chip.dart';
import 'package:blackjack/const/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Gamescreen extends StatefulWidget {
  const Gamescreen({super.key});

  @override
  State<Gamescreen> createState() => _GamescreenState();
}

class _GamescreenState extends State<Gamescreen> {
  double musicValue = 0;
  double soundValue = 0;
  bool isCheck = false;
  blackjackGameState state = blackjackGameState();

  @override
  void initState() {
    super.initState();
    state.initializeGame();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int valuePlayer = Provider.of<blackjackGameState>(context).valuePlayer;
    int valueDealer = Provider.of<blackjackGameState>(context).valueDealer;
    bool isT = true;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            board,
            width: width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: -70,
            left: 10,
            child: Row(
              children: [
                Image.asset(
                  totalcredit,
                  width: 200,
                  height: 200,
                ),
              ],
            ),
          ),
          Column(
            children: [
              Consumer<blackjackGameState>(
                builder: (context, gameState, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: gameState.dealerCards
                        .map((card) => AnimatedCard(
                              direction: AnimatedCardDirection.top,
                              initDelay: const Duration(milliseconds: 0),
                              duration: const Duration(seconds: 1),
                              child: DealerCard(
                                card: card,
                                game: blackjackGameState.gameOver,
                              ),
                            ))
                        .toList(),
                  );
                },
              ),
              const SizedBox(height: 9),
              Consumer<blackjackGameState>(
                builder: (context, gameState, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: gameState.playerCards
                        .map((card) => AnimatedCard(
                              direction: AnimatedCardDirection.bottom,
                              initDelay: const Duration(milliseconds: 0),
                              duration: const Duration(seconds: 1),
                              child: CardWidget(card: card),
                            ))
                        .toList(),
                  );
                },
              ),
            ],
          ),
          Positioned(
            left: -10,
            bottom: -110,
            child: Stack(
              children: [
                Image.asset(
                  box,
                  height: 300,
                  width: 900,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 110, left: 270),
                  child: Row(
                    children: [
                      ImangeIncon(chip1),
                      const SizedBox(width: 8),
                      ImangeIncon(chip10),
                      const SizedBox(width: 8),
                      ImangeIncon(chip100),
                      const SizedBox(width: 8),
                      ImangeIncon(chip500),
                      const SizedBox(width: 8),
                      ImangeIncon(chip1000),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: height * 0.15,
            left: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isCheck == true) {
                        Provider.of<blackjackGameState>(context, listen: false)
                            .stand();
                        isCheck = false;
                      } else {
                        debugPrint('njksdkjfcs');
                      }
                    });
                  },
                  child: Image.asset(
                    start,
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Provider.of<blackjackGameState>(context, listen: false)
                        .resetGame();
                    isT = true;
                  },
                  child: Image.asset(
                    resrt,
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Provider.of<blackjackGameState>(context, listen: false)
                          .hit();
                    });
                  },
                  child: Image.asset(
                    hit,
                    width: 100,
                    height: 100,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 130,
            left: width * 0.27,
            child: GestureDetector(
              onTap: () {
                Provider.of<blackjackGameState>(context, listen: false)
                    .initializeGame();
                isCheck = true;
              },
              child: Image.asset(
                retry,
                width: 50,
                height: 50,
              ),
            ),
          ),
          Positioned(
            top: 130,
            left: 300,
            child: Container(
              width: 250,
              height: 50,
              color: Colors.white.withOpacity(0.3),
            ),
          ),
          Positioned(
            top: 30,
            right: 150,
            child: SizedBox(
              width: 80,
              height: 240,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Consumer<blackjackGameState>(
                      builder: (context, value, child) {
                        return Text(
                          '${blackjackGameState.gameOver ? valueDealer : '?'}',
                          style: TextStyle(
                            color:
                                valueDealer == 21 ? Colors.red : Colors.black,
                            fontSize: 30,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                      alignment: Alignment.center,
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Consumer<blackjackGameState>(
                        builder: (context, value, child) {
                          return Text(
                            valuePlayer.toString(),
                            style: TextStyle(
                              color:
                                  valuePlayer == 21 ? Colors.red : Colors.black,
                              fontSize: 30,
                            ),
                          );
                        },
                      )),
                ],
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.transparent,
                    actions: [
                      Stack(
                        children: [
                          Image.asset(
                            menu,
                            width: 320,
                            height: 320,
                          ),
                          Positioned(
                            top: 110,
                            left: 50,
                            child: StatefulBuilder(
                              builder: (context, setState) {
                                return Slider(
                                  value: musicValue,
                                  onChanged: (ee) {
                                    setState(() {
                                      musicValue = ee;
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                          Positioned(
                            top: 160,
                            left: 50,
                            child: StatefulBuilder(
                              builder: (context, setState) {
                                return Slider(
                                  value: soundValue,
                                  onChanged: (ee) {
                                    setState(() {
                                      soundValue = ee;
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                          Positioned(
                              top: 120,
                              left: 30,
                              child: StatefulBuilder(
                                builder: (context, setState) => Image.asset(
                                  musicValue == 0 ? off_music : music,
                                  width: 30,
                                  height: 30,
                                ),
                              )),
                          Positioned(
                            top: 170,
                            left: 30,
                            child: Image.asset(
                              soundValue == 0 ? off_sound : sound,
                              width: 30,
                              height: 30,
                            ),
                          ),
                          Positioned(
                            top: 200,
                            left: 126,
                            child: ElevatedButton(
                              style: ButtonStyle(),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.home,
                                    color: Colors.lightGreen.shade400,
                                  ),
                                ],
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ));
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              child: Image.asset(
                setting,
                width: 50,
                height: 50,
              ),
            ),
          ),
          if (blackjackGameState.gameOver) ...{
            Positioned(
              top: 100,
              left: width * 0.4,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        offset: const Offset(-0.4, 4),
                      ),
                      BoxShadow(
                        blurRadius: 20,
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        offset: const Offset(4, -0.4),
                      ),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(valuePlayer > 21
                        ? 'You Bust!'
                        : (valueDealer > 21 || valuePlayer > valueDealer)
                            ? 'You Win!'
                            : (valueDealer > valuePlayer)
                                ? 'You Lose!'
                                : 'Push!'),
                    const SizedBox(height: 10),
                    if (blackjackGameState.gameOver) ...{
                      TextButton(
                        onPressed: () => Provider.of<blackjackGameState>(
                                context,
                                listen: false)
                            .resetGame(),
                        child: const Text('Play Again'),
                      )
                    }
                  ],
                ),
              ),
            )
          }
        ],
      ),
    );
  }
}
