import 'package:flutter/material.dart';
import 'package:fun_quiz/services/quizbrain.dart';
import 'package:provider/provider.dart';
import 'screens/homepage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Scorebrain(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        accentColor: Color(0xffD448E1),
        primaryColor: Color(0xff6A2C70),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
