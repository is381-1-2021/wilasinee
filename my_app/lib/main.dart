import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_app/controller/MemController.dart';

import 'package:my_app/pages/Cal.dart';
import 'package:my_app/pages/Hist.dart';
import 'package:my_app/services/services.dart';
import 'package:provider/provider.dart';

import 'models/MemOperation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var services = FirebaseServices();
  var controller = MemController(services);

  runApp(ChangeNotifierProvider(
    create: (context) => MemOperation(),
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
          '/1': (context) => Cal(),
          '/2': (context) => History(),
        });
  }
}
