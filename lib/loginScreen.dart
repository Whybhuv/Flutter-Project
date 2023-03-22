import 'dart:ffi';


import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_project/gameScreen.dart';
import 'package:flutter_project/widgets/button.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController myController = TextEditingController();

  var _text = '';
  
  var counter = 0;

  String? get _errorText {
    final text = myController.value.text;

    // Visibility(visible: isVisible,child: Column(children: [],));
    // if(counter==1){
    //   return "Can't be Empty!";
    // }
    if (text.isEmpty) {
      
      return "Can't be Empty!";
      
    }
    
    return null;
      
  }

  @override
  @override

  //disposing mycontroller when widget is unmounted
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "Enter your name!",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "PressStart",
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                  fontSize: 35.0,
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextField(
                controller: myController,
                cursorColor: Colors.white,
                cursorWidth: 5,
                decoration: InputDecoration(
                    filled: true,
                    hintStyle: TextStyle(
                        color: Colors.white38,
                        fontFamily: "PressStart",
                        fontSize: 12),
                    hintText: "Enter your name!",
                    //calling the error text fxn
                    errorText: _errorText,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15)),
                    fillColor: Color.fromARGB(146, 111, 111, 111)),
                onChanged: (text) => setState(() => _text),
                style: const TextStyle(
                    color: Colors.white, fontFamily: "PressStart"),
              ),
            ),
            // FloatingActionButton(
            //   onPressed: () {
            //     _sendDataToSecondScreen(context);
            //   },
            //   child: const Icon(Icons.play_arrow),
            // ),
            const SizedBox(
              height: 40,
            ),
            myButton(
              value: "Play!",
              isSmall: false,
              onPressed: () {
                
                counter++;
                myController.value.text.isNotEmpty
                    ? _sendDataToSecondScreen(context)
                    : Null;
              },
            )
          ]),
        ));
  }

  void _sendDataToSecondScreen(BuildContext context) {
    String textToSend = myController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => gameScreen(
            word: textToSend,
          ),
        ));
  }
}
