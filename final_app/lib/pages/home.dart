import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String output = '0';

  String _output = '0';

  double num1 = 0.0;

  double num2 = 0.0;

  String operand = '';

  buttonPressed(String buttonText) {
    if (buttonText == 'CLEAR') {
      _output = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == 'x' ||
        buttonText == '/') {
      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";
    } else if (buttonText == '.') {
      if (_output.contains('.')) {
        print('Already contains a decimals');
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == '=') {
      num2 = double.parse(output);

      if (operand == '+') {
        _output = (num1 + num2).toString();
      }

      if (operand == '-') {
        _output = (num1 - num2).toString();
      }
      if (operand == 'x') {
        _output = (num1 * num2).toString();
      }
      if (operand == '/') {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else {
      _output = _output + buttonText;
    }

    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(4);
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: MaterialButton(
        padding: EdgeInsets.all(24),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          buttonPressed(buttonText);
        },
        color: Colors.blueGrey,
        textColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
              child: Text(
                output,
                style: TextStyle(fontSize: 44.0, fontWeight: FontWeight.bold),
              )),
          Expanded(child: Divider()),
          Column(
            children: [
              Row(
                children: [
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('/')
                ],
              ),
              Row(
                children: [
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('x')
                ],
              ),
              Row(
                children: [
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('-')
                ],
              ),
              Row(
                children: [
                  buildButton('.'),
                  buildButton('0'),
                  buildButton('00'),
                  buildButton('+')
                ],
              ),
              Row(
                children: [
                  buildButton('CLEAR'),
                  buildButton('='),
                ],
              ),
            ],
          )
        ],
      )),
    );
  }
}
