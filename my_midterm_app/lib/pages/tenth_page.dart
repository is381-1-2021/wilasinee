import 'package:flutter/material.dart';

class TenthPage extends StatefulWidget {
  @override
  _TenthPageState createState() => _TenthPageState();
}

class _TenthPageState extends State<TenthPage> {
  String? _message = 'Here is where we get value back.';
  List<String> strings = [];

  void _addQuoteEntry() {
    setState(() => strings.add("$_message"));
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: Text('Your monthly quote'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: strings.map((String string) {
          return Container(
              child:
                  Text(string, style: TextStyle(fontSize: 15.0, height: 1.5)));
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var response = await Navigator.pushNamed(context, '/9');
          setState(() {
            _message = '${now.day}' +
                ' / ' +
                '${now.month}' +
                ' / ' +
                '${now.year}' +
                ' @ ' +
                '${now.hour} : ${now.minute}' +
                '   ' +
                '\'' +
                response.toString() +
                '\'';
          });
          _addQuoteEntry();
        },
        tooltip: 'Add new quote',
        child: Icon(Icons.add),
      ),
    );
  }
}
