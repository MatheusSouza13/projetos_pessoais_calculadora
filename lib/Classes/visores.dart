import 'package:flutter/material.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';

class VisorPrincipal extends StatelessWidget {
  final TextEditingController controladorVisorPrincipal;

  const VisorPrincipal(this.controladorVisorPrincipal);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: AutoSizeTextField(
        minFontSize: 35,
        stepGranularity: 5,
        textAlign: TextAlign.end,
        readOnly: true,
        showCursor: true,
        style: TextStyle(fontSize: 60),
        decoration: InputDecoration(border: InputBorder.none),
        controller: controladorVisorPrincipal,
      ),
    );
  }
}

class VisorResultado extends StatelessWidget {
  final TextEditingController controladorVisorResultado;

  const VisorResultado(this.controladorVisorResultado);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: AutoSizeTextField(
        minFontSize: 20,
        stepGranularity: 5,
        textAlign: TextAlign.end,
        readOnly: true,
        style: TextStyle(fontSize: 30, color: Colors.white54),
        decoration: InputDecoration(border: InputBorder.none),
        controller: controladorVisorResultado,
      ),
    );
  }
}
