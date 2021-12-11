import 'package:final_app/models/history_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/history.dart';
import 'pages/home.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => HistoryModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.blueGrey,
        ),
        initialRoute: '/1',
        routes: <String, WidgetBuilder>{
          '/1': (context) => Home(),
          '/2': (context) => History()
        });
  }
}
