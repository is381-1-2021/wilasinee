import 'package:flutter/material.dart';
import 'package:midterm_app/models/form_model.dart';
import 'package:provider/provider.dart';

import 'pages/first_page.dart';
import 'pages/fourth_page.dart';
import 'pages/nineth_page.dart';
import 'pages/second_page.dart';
import 'pages/tenth_page.dart';
import 'pages/third_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => FormModel(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Moodish',
        theme: ThemeData(
          primaryColor: Color(0xFF8B82D0),
          accentColor: Color(0xFF5F478C),
        ),
        home: MyHomePage(title: 'Home'),
        initialRoute: '/10',
        routes: <String, WidgetBuilder>{
          '/10': (context) => TenthPage(),
          '/9': (context) => NinethPage(),
          '/1': (context) => FirstPage(),
          '/2': (context) => SecondPage(),
          '/3': (context) => ThirdPage(),
          '/4': (context) => FourthPage(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF8B82D0),
                  fixedSize: Size(240, 80),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/9');
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.add),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Add your daily quote'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF8B82D0),
                  fixedSize: Size(240, 80),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/10');
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.list_alt_rounded),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('View your monthly quotes'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF8B82D0),
                  fixedSize: Size(240, 80),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/1');
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.article),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Blank Page 1'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF8B82D0),
                  fixedSize: Size(240, 80),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/2');
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.article),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Blank Page 2'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF8B82D0),
                  fixedSize: Size(240, 80),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/3');
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.article),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Blank Page 3'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF8B82D0),
                  fixedSize: Size(240, 80),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/4');
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.article),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Blank Page 4'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
