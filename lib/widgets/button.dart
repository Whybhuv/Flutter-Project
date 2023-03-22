import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class myButton extends StatelessWidget {
  String value;
  Function onPressed;
  final bool isSmall;
  myButton(
      {Key? key,
      required this.value,
      required this.isSmall,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scaleFactor = isSmall ? 0.3 : 0.5;
    return ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(146, 111, 111, 111),
            minimumSize:
                Size(MediaQuery.of(context).size.width * scaleFactor, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: Text(
          value,
          style: TextStyle(fontFamily: "PressStart"),
        ));
  }
}
