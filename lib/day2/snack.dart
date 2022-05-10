import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Snack extends StatefulWidget {
  const Snack({Key? key}) : super(key: key);

  @override
  _SnackState createState() => _SnackState();
}

class _SnackState extends State<Snack> {
  final double BLOCK_SIZE = 20;
  late Timer timer;
  String gameStatus = 'START';
  String direction = 'RIGHT';
  double x = 40, y = 40, BOX_SIZE = 300;
  double xGift = 40, yGift = 40;
  int score = 0;

  var random = Random();

  setDirection(String value) {
    setState(() {
      if (value != direction) {
        direction = value;
      }
    });
  }

  void moveSnack() {
    if (x == xGift && y == yGift) {
      setState(() {
        score = score + 1;
        xGift = random.nextInt(10) * 20;
        yGift = random.nextInt(10) * 20;
      });
    }

    if (x == BOX_SIZE - 20 || y == BOX_SIZE - 20 || x < 0 || y < 0) {
      setState(() {
        gameStatus = 'END';
      });
    } else {
      switch (direction) {
        case 'LEFT':
          setState(() {
            y = y - 20;
          });
          break;
        case 'RIGHT':
          setState(() {
            y = y + 20;
          });
          break;
        case 'UP':
          setState(() {
            x = x - 20;
          });
          break;
        case 'DOWN':
          setState(() {
            x = x + 20;
          });
      }
    }
  }

  startGame() {
    setState(() {
      gameStatus = 'RUNNING';
      direction = 'RIGHT';
      x = 40;
      y = 40;
      xGift = random.nextInt(10) * 20;
      yGift = random.nextInt(10) * 20;
      score = 0;
    });
    timer = Timer.periodic(
        const Duration(milliseconds: 1000), (Timer t) => moveSnack());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snack game'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
        child: Column(
          children: [
            Text(
              'Score: $score',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Stack(
              children: [
                Container(
                  color: Colors.red,
                  height: BOX_SIZE,
                  width: BOX_SIZE,
                  child: gameStatus != 'RUNNING'
                      ? Center(
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              gameStatus == 'START'
                                  ? 'Welcome to snack game'
                                  : 'Game over',
                              style: TextStyle(fontSize: 22),
                            ),
                            TextButton(
                              child: Text(
                                gameStatus == 'START'
                                    ? 'Start Game'
                                    : 'Play Again',
                              ),
                              onPressed: () {
                                setState(() {
                                  startGame();
                                });
                              },
                            ),
                          ],
                        ))
                      : const SizedBox.shrink(),
                ),
                Container(
                  child: gameStatus == 'RUNNING'
                      ? Positioned(
                          top: xGift,
                          left: yGift,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                border: Border.all(color: Colors.black)),
                            width: BLOCK_SIZE,
                            height: BLOCK_SIZE,
                          ))
                      : const SizedBox.shrink(),
                ),
                Container(
                  child: gameStatus == 'RUNNING'
                      ? Positioned(
                          top: x,
                          left: y,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                border: Border.all(color: Colors.black)),
                            width: BLOCK_SIZE,
                            height: BLOCK_SIZE,
                          ))
                      : const SizedBox.shrink(),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 80),
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          setDirection('LEFT');
                        });
                      },
                      child: const Icon(
                        Icons.arrow_left,
                        size: 30,
                      )),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              setDirection('UP');
                            });
                          },
                          child: const Icon(
                            Icons.arrow_drop_up,
                            size: 30,
                          )),
                      const SizedBox(height: 60),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              setDirection('DOWN');
                            });
                          },
                          child: const Icon(
                            Icons.arrow_drop_down,
                            size: 30,
                          )),
                    ],
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          setDirection('RIGHT');
                        });
                      },
                      child: const Icon(
                        Icons.arrow_right,
                        size: 30,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
