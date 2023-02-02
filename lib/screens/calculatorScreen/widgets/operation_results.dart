import 'package:calculator/controller/calculator_controller.dart';
import 'package:calculator/screens/historyScreen/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main_result.dart';

class OperationResults extends StatelessWidget {
  OperationResults({super.key});
  final calculatorCtrl = Get.find<CalculatorController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            MainResultText(text: '${calculatorCtrl.mathResult}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HistoryScreen()),
                    );
                  },
                  child: Icon(Icons.watch_later_outlined,
                      size: 18, color: Colors.white.withOpacity(0.4)),
                ),
                InkWell(
                  onTap: () => calculatorCtrl.backSpace(),
                  child: Icon(
                    Icons.backspace_outlined,
                    size: 18,
                    color: Colors.white.withOpacity(0.4),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(
                height: 2.0,
                color: Colors.white.withOpacity(0.4),
              ),
            )
          ],
        ));
  }
}
