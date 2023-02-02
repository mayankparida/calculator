import 'package:flutter/material.dart';

class OperationButton extends StatelessWidget {
  final Color bgColor;
  final Color iconColor;
  final Function onPressed;
  final IconData icon;
  const OperationButton(
      {Key? key,
      bgColor,
      required this.onPressed,
      required this.icon,
      this.iconColor = Colors.white})
      : bgColor = bgColor ?? const Color.fromRGBO(23, 23, 23, 1),
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
          height: 65,
          child: Center(
              child: Icon(
            icon,
            color: iconColor,
          )),
        ),
        onPressed: () => onPressed(),
      ),
    );
  }
}
