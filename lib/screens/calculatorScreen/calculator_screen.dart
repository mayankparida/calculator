import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/calculator_controller.dart';
import 'widgets/caculator_panel.dart';
import 'widgets/operation_results.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final calculatorCtrl = Get.put(CalculatorController());

  final calculatorCtrl1 = Get.find<CalculatorController>();

  getHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? history = prefs.getStringList('history');
    calculatorCtrl1.getHistory(history ?? []);
  }

  @override
  void initState() {
    super.initState();
    getHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Expanded(
            //   child: Container(),
            // ),
            OperationResults(),
            CalculatorPanel(),
          ],
        ),
      ),
    ));
  }
}
