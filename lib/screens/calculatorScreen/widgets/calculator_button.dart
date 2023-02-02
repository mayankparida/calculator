import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final bool big;
  final String text;

  final Function onPressed;

  const CalculatorButton({
    Key? key,
    bgColor,
    this.textColor = Colors.white,
    this.big = false,
    required this.text,
    required this.onPressed,
  })  : bgColor = bgColor ?? const Color.fromRGBO(23, 23, 23, 1),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // Button
    final buttonStyle = TextButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: bgColor,
      shape: const CircleBorder(),
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      child: TextButton(
        style: buttonStyle,
        child: SizedBox(
          // width: this.big ? 150 : 65,
          height: 65,
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w300, color: textColor),
          )),
        ),
        onPressed: () => onPressed(),
      ),
    );
  }
}
