import 'package:calculator/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/calculator_controller.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final calculatorCtrl = Get.find<CalculatorController>();
  List<String> history = [];

  clearHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('history');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GetBuilder(
                  init: calculatorCtrl,
                  builder: (_) => ListView(
                      children: List<Widget>.generate(
                          calculatorCtrl.history.length,
                          (index) => Text(
                                calculatorCtrl.history[index],
                                style: TextStyle(
                                    color: CalcColors.green, fontSize: 20.0),
                              ))),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                onPressed: () {
                  calculatorCtrl.clearHistory();
                  clearHistory();
                },
                child: const Text("Clear History")),
          )
        ],
      )),
    );
  }
}
