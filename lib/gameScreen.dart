import 'dart:async';

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_project/widgets/button.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class gameScreen extends StatefulWidget {
  final String word;
  gameScreen({Key? key, required this.word}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _gameScreenState(this.word);
  }
}

class _gameScreenState extends State<gameScreen> {
  String word;
  _gameScreenState(this.word);
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference players =
      FirebaseFirestore.instance.collection('players');
  late Timer _timer;
  bool click = true;
  bool result = false;
  int _start = 5;
  final stopwatch = Stopwatch();
  var _answer;

  Random random = new Random();
  // void showResult() {
  //   if (result)
  //     Text(
  //       "clicked",
  //       style: TextStyle(color: Colors.white),
  //     );
  // }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    int randomNumber = random.nextInt(5);

    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (randomNumber == 0) {
          setState(() {
            click = !click;
            timer.cancel();
            stopwatch.start();
            print(stopwatch.isRunning);
          });
        } else {
          setState(() {
            randomNumber--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (click == false) ? Colors.white : Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(146, 111, 111, 111),
      //   centerTitle: false,
      //   titleSpacing: 0.0,
      //   title: Transform(
      //     transform: Matrix4.translationValues(75.0, 0.0, 0.0),
      //     child: Text("Reaction Test!"),
      //   ),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            Text(
              "Press STOP as the Color changes!",
              style: TextStyle(
                  color: (click == false) ? Colors.black : Colors.white,
                  fontSize: 30.0,
                  fontFamily: "PressStart",
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                  fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            Text(
              "Tap the Start Button to start!",
              style: TextStyle(
                  color: (click == false) ? Colors.black : Colors.white,
                  fontSize: 17.0,
                  fontFamily: 'PressStart',
                  //fontStyle: FontStyle.italic,
                  height: 1.4,
                  fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,

            ),
            const SizedBox(height: 60),
            // ElevatedButton(
            //   onPressed: () {
            //     //_startCoundown();
            //     setState(() {
            //       startTimer();
            //       result = false;
            //     });
            //     //stopwatch.start();
            //     //print(stopwatch.isRunning);
            //   },
            //   child: Text("Start!"),
            //   style: ElevatedButton.styleFrom(
            //       primary: Color.fromARGB(146, 111, 111, 111)),
            // ),
            myButton(
              value: "Start!",
              isSmall: false,
              onPressed: () {
                setState(() {
                  startTimer();
                  result = false;
                });
              },
            ),
            const SizedBox(height: 30),
            // ElevatedButton(
            //   onPressed: () async {
            //     //_startCoundown();
            //     setState(() {
            //       click = !click;
            //       result = true;
            //     });
            //     stopwatch.stop();
            //     print(stopwatch.isRunning);
            //     Duration elapsed = stopwatch.elapsed;
            //     //await Future.delayed(const Duration(seconds: 1));
            //     //assert(stopwatch.elapsed == elapsed);
            //     print(stopwatch.elapsedMilliseconds);
            //     _answer = stopwatch.elapsedMilliseconds;
            //     stopwatch.reset();
            //     print(stopwatch.elapsedMilliseconds);
            //   },
            //   child: Text("STOP!"),
            //   style: ElevatedButton.styleFrom(
            //       primary: Color.fromARGB(146, 111, 111, 111)),
            // ),
            myButton(
                value: "Stop!",
                isSmall: false,
                onPressed: () async {
                  setState(() {
                    click = !click;
                    result = true;
                  });
                  stopwatch.stop();
                  print(stopwatch.isRunning);
                  Duration elapsed = stopwatch.elapsed;
                  //await Future.delayed(const Duration(seconds: 1));
                  //assert(stopwatch.elapsed == elapsed);
                  print(stopwatch.elapsedMilliseconds);
                  _answer = stopwatch.elapsedMilliseconds;
                  stopwatch.reset();
                  print(stopwatch.elapsedMilliseconds);
                  players.add({
                    'name': word,
                    'time': _answer,
                  });
                }),
            const SizedBox(
              height: 60,
            ),
            Visibility(
                visible: result,
                child: (Column(
                  children: [
                    Text(
                      "Your reaction time is ${_answer}ms",
                      style: TextStyle(
                          color: Colors.green, fontFamily: "PressStart"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text("Press Start to Retry!",
                        style: TextStyle(
                            color: Colors.green, fontFamily: "PressStart")),
                  ],
                )))
          ],
        ),
      ),
    );
  }
}
