import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x = 0;
  int y = 0;
  num z = 0;

  // ignore: non_constant_identifier_names
  final DisplayOneController = TextEditingController();
  // ignore: non_constant_identifier_names
  final DisplayTwoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    DisplayOneController.text = x.toString();
    DisplayTwoController.text = y.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Calculator_Display(
              hint: "Enter First Number", controller: DisplayOneController),
          const SizedBox(
            height: 30,
          ),
          Calculator_Display(
              hint: "Enter Second Number", controller: DisplayTwoController),
          const SizedBox(
            height: 30,
          ),
          Text(
            z.toString(),
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(DisplayOneController.text)! +
                        num.tryParse(DisplayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(DisplayOneController.text)! -
                        num.tryParse(DisplayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(DisplayOneController.text)! *
                        num.tryParse(DisplayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(DisplayOneController.text)! /
                        num.tryParse(DisplayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.divide),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                x = 0;
                y = 0;
                z = 0;
                DisplayOneController.clear();
                DisplayTwoController.clear();
              });
            },
            label: const Text("CLEAR"),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class Calculator_Display extends StatelessWidget {
  const Calculator_Display({
    super.key,
    this.hint = "Enter a Number",
    required this.controller,
  });

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(20)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(20)),
          hintText: "Enter a number",
          hintStyle: const TextStyle(color: Colors.black)),
    );
  }
}
