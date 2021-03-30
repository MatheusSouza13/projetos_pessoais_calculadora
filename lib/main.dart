import 'package:app_calculadora03/Screens/screens.dart';
import 'package:flutter/material.dart';

void main() => runApp(CalculadoraApp());

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fundamentos Flutter",
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey,
      ),
      home: TelaPrincipal(),
    );
  }
}
