import 'package:flutter/material.dart';
import 'package:flutter_project/gameScreen.dart';
import 'package:flutter_project/loginScreen.dart';
import 'dart:math' as math;

import 'package:flutter_project/main.dart';
import 'package:flutter_project/widgets/button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(146, 111, 111, 111),
      //   title: const Center(
      //       child: Text("Reaction Test",
      //           style: TextStyle(
      //               fontWeight: FontWeight.w500,
      //               fontFamily: 'Open Sans',
      //               fontStyle: FontStyle.italic))),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Response.",
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 33.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'PressStart',
                  fontStyle: FontStyle.italic,
                  height: 1.2,
                  // wordSpacing: 5.0,
                )),
            const SizedBox(
              height: 60,
            ),
            const Text(
              "Press Start to Begin!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'PressStart',
                height: 1.2,
                //fontStyle: FontStyle.italic
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => gameScreen()),
            //     );
            //   },
            //   child: Text("Start!"),
            //   style: ElevatedButton.styleFrom(
            //       primary: Color.fromARGB(146, 111, 111, 111)),
            // )
            const SizedBox(
              height: 80,
            ),
            myButton(
                value: "Start!",
                isSmall: false,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => loginScreen()));
                })
          ],
        ),
      ),
    );
  }
}
