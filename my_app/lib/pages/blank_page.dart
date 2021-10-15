import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/10');
          },
          child: Text('page 10'),
        ),
      ),
    );
  }
}
