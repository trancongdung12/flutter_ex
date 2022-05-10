import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class ItemCalculate {
  String title;
  Color? color;
  bool? isBottom;
  ItemCalculate({required this.title, this.color, this.isBottom});
}

class _CalculatorState extends State<Calculator> {
  final List<ItemCalculate> _items = [
    ItemCalculate(title: 'C', color: Colors.grey),
    ItemCalculate(title: '<', color: Colors.grey),
    ItemCalculate(title: '%', color: Colors.grey),
    ItemCalculate(title: '+', color: Colors.orange),
    ItemCalculate(title: '7'),
    ItemCalculate(title: '8'),
    ItemCalculate(title: '9'),
    ItemCalculate(title: '-', color: Colors.orange),
    ItemCalculate(title: '4'),
    ItemCalculate(title: '5'),
    ItemCalculate(title: '6'),
    ItemCalculate(title: '*', color: Colors.orange),
    ItemCalculate(title: '3'),
    ItemCalculate(title: '2'),
    ItemCalculate(title: '1'),
    ItemCalculate(title: '/', color: Colors.orange),
    ItemCalculate(title: '0', isBottom: true),
    ItemCalculate(title: '.', isBottom: true),
    ItemCalculate(title: '=', color: Colors.orange, isBottom: true),
  ];

  String output = '0';
  String _output = '0';
  double num1 = 0;
  double num2 = 0;
  String operand = '';

  void onCalculate(String buttonText) {
    if (buttonText == 'C') {
      _output = '0';
      num1 = 0;
      num2 = 0;
      operand = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '*' ||
        buttonText == '/') {
      num1 = double.parse(output);
      operand = buttonText;
      _output = '0';
    } else if (buttonText == '.' || buttonText == '%' || buttonText == '<') {
      return;
    } else if (buttonText == '=') {
      num2 = double.parse(output);
      if (operand == '+') {
        _output = (num1 + num2).toString();
      }

      if (operand == '-') {
        _output = (num1 - num2).toString();
      }

      if (operand == '*') {
        _output = (num1 * num2).toString();
      }

      if (operand == '/') {
        if (num2 == 0) {
          return;
        }
        _output = (num1 ~/ num2).toString();
      }

      num1 = 0;
      num2 = 0;
      operand = '';
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: screenWidth,
              height: screenWidth - 100,
              padding: const EdgeInsets.only(right: 10, bottom: 5),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black26, width: 1.0))),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  output,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 60, fontWeight: FontWeight.bold),
                ),
              )),
          Container(
            padding: const EdgeInsets.all(20),
            child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: _items
                    .map((item) => CircleWidget(
                        screenWidth: screenWidth,
                        item: item,
                        onCalculate: onCalculate))
                    .toList()),
          ),
        ],
      ),
    );
  }
}

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    Key? key,
    required this.screenWidth,
    required this.item,
    required this.onCalculate,
  }) : super(key: key);

  final double screenWidth;
  final ItemCalculate item;
  final Function onCalculate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: item.isBottom == true
          ? (screenWidth - 80) / 3
          : (screenWidth - 100) / 4,
      height: item.isBottom == true ? 60 : (screenWidth - 100) / 4,
      child: ElevatedButton(
        onPressed: () {
          onCalculate(item.title);
        },
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: item.color ?? Colors.black12,
            shadowColor: Colors.transparent),
        child: Text(
          item.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
