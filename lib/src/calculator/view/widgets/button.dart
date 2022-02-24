import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color bgColor;

  final String text;

  final Function onPressed;

  Button({
    Key? key,
    bgColor,
    required this.text,
    required this.onPressed,
  })  : this.bgColor = bgColor ?? Colors.blue,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonStyle = TextButton.styleFrom(
      backgroundColor: this.bgColor,
      primary: Colors.white,
      // shape: StadiumBorder(),
    );

    return Container(
      margin: EdgeInsets.only(bottom: 10, right: 5, left: 5),
      child: TextButton(
        style: buttonStyle,
        child: Container(
          width: 65,
          height: 65,
          child: Center(
              child: Text(
            this.text,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
          )),
        ),
        onPressed: () => this.onPressed(),
      ),
    );
  }
}
