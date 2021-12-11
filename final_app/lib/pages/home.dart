import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  String output = "0";

  Widget buildButton(String buttonText) {
    return Expanded(
      child: MaterialButton(
        padding: EdgeInsets.all(24),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () {},
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
