import 'package:calculator/colors.dart';
import 'package:calculator/controller/calculator_controller.dart';
import 'package:calculator/screens/calculatorScreen/widgets/operation_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'calculator_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalculatorPanel extends StatelessWidget {
  final calculatorCtrl = Get.find<CalculatorController>();

  CalculatorPanel({super.key});

  storeHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('history', calculatorCtrl.history);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalculatorButton(
              text: 'C',
              onPressed: () => calculatorCtrl.resetAll(),
              textColor: Colors.red,
            ),
            CalculatorButton(
              text: '()',
              onPressed: () {},
              textColor: CalcColors.green,
            ),
            OperationButton(
              onPressed: () => calculatorCtrl.selectOperation('%'),
              icon: Icons.percent,
              iconColor: CalcColors.green,
            ),
            CalculatorButton(
              text: '÷',
              onPressed: () => calculatorCtrl.selectOperation('/'),
              textColor: CalcColors.green,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalculatorButton(
              text: '7',
              onPressed: () => calculatorCtrl.addNumber('7'),
            ),
            CalculatorButton(
              text: '8',
              onPressed: () => calculatorCtrl.addNumber('8'),
            ),
            CalculatorButton(
              text: '9',
              onPressed: () => calculatorCtrl.addNumber('9'),
            ),
            OperationButton(
              onPressed: () => calculatorCtrl.selectOperation('X'),
              icon: Icons.close,
              iconColor: CalcColors.green,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalculatorButton(
              text: '4',
              onPressed: () => calculatorCtrl.addNumber('4'),
            ),
            CalculatorButton(
              text: '5',
              onPressed: () => calculatorCtrl.addNumber('5'),
            ),
            CalculatorButton(
              text: '6',
              onPressed: () => calculatorCtrl.addNumber('6'),
            ),
            OperationButton(
              onPressed: () => calculatorCtrl.selectOperation('-'),
              icon: Icons.remove,
              iconColor: CalcColors.green,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalculatorButton(
              text: '1',
              onPressed: () => calculatorCtrl.addNumber('1'),
            ),
            CalculatorButton(
              text: '2',
              onPressed: () => calculatorCtrl.addNumber('2'),
            ),
            CalculatorButton(
              text: '3',
              onPressed: () => calculatorCtrl.addNumber('3'),
            ),
            OperationButton(
              onPressed: () => calculatorCtrl.selectOperation('+'),
              icon: Icons.add,
              iconColor: CalcColors.green,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalculatorButton(
              text: '+/-',
              big: true,
              onPressed: () => calculatorCtrl.changeNegativePositive(),
            ),
            CalculatorButton(
              text: '0',
              big: true,
              onPressed: () => calculatorCtrl.addNumber('0'),
            ),
            CalculatorButton(
              text: '.',
              onPressed: () => calculatorCtrl.addDecimalPoint(),
            ),
            CalculatorButton(
                text: '=',
                bgColor: CalcColors.green,
                onPressed: () {
                  calculatorCtrl.calculateResult();
                  storeHistory();
                }),
          ],
        ),
      ],
    );
  }
}
