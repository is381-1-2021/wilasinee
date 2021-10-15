import 'package:flutter/material.dart';
import 'package:my_app/models/NotesOperation.dart';
import 'package:my_app/pages/blank_page.dart';
import 'package:my_app/pages/AddQuote.dart';
import 'package:my_app/pages/AllQuote.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => NotesOperation(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color(0xFF8B82D0),
          accentColor: Color(0xFF5F478C),
        ),
        initialRoute: '/0',
        routes: <String, WidgetBuilder>{
          '/10': (context) => AllQuote(),
          '/9': (context) => AddQuote(),
          '/0': (context) => BlankPage()
        });
  }
}
