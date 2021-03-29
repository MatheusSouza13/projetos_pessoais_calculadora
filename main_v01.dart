import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark, primaryColor: Colors.blueGrey),
        home: TelaPrincipal(),
      ),
    );

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  final TextEditingController controladorVisorPrincipal =
      TextEditingController();
  final TextEditingController controladorVisorSecundario =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 70),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: visorPrincipal(controladorVisorPrincipal),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: visorSecundario(controladorVisorSecundario),
            ),
            Padding(padding: EdgeInsets.only(top: 60)),
            Flexible(
              child: Row(
                children: [
                  //COLUNA 7 4 1 .
                  Column(
                    children: [
                      botaoTexto("7", controladorVisorPrincipal,
                          controladorVisorSecundario),
                      botaoTexto("4", controladorVisorPrincipal,
                          controladorVisorSecundario),
                      botaoTexto("1", controladorVisorPrincipal,
                          controladorVisorSecundario),
                      botaoTexto(".", controladorVisorPrincipal,
                          controladorVisorSecundario),
                    ],
                  ),

                  //COLUNA 8 5 2 0
                  Column(
                    children: [
                      botaoTexto("8", controladorVisorPrincipal,
                          controladorVisorSecundario),
                      botaoTexto("5", controladorVisorPrincipal,
                          controladorVisorSecundario),
                      botaoTexto("2", controladorVisorPrincipal,
                          controladorVisorSecundario),
                      botaoTexto("0", controladorVisorPrincipal,
                          controladorVisorSecundario),
                    ],
                  ),
                  //COLUNA 9 6 3 =
                  Column(
                    children: [
                      botaoTexto("9", controladorVisorPrincipal,
                          controladorVisorSecundario),
                      botaoTexto("6", controladorVisorPrincipal,
                          controladorVisorSecundario),
                      botaoTexto("3", controladorVisorPrincipal,
                          controladorVisorSecundario),
                      botaoIgual("=", controladorVisorPrincipal,
                          controladorVisorSecundario),
                    ],
                  ),

                  //COLUNA 9 6 3 =
                  Column(
                    children: [
                      botaoApagar("C", controladorVisorPrincipal,
                          controladorVisorSecundario),
                      botaoAcao("/", controladorVisorPrincipal,
                          controladorVisorSecundario),
                      botaoAcao("*", controladorVisorPrincipal,
                          controladorVisorSecundario),
                      botaoAcao("-", controladorVisorPrincipal,
                          controladorVisorSecundario),
                      botaoAcao("+", controladorVisorPrincipal,
                          controladorVisorSecundario),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(color: Colors.blue),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget botaoTexto(txt, TextEditingController controladorVisorPrincipal,
      TextEditingController controladorVisorSecundario) {
    return Expanded(
      child: Container(
        width: 90,
        height: 100,
        child: TextButton(
          onPressed: () {
            controladorVisorPrincipal.text += txt;
            controladorVisorSecundario.text =
                calcular(controladorVisorPrincipal);
          },
          child: Text(
            txt,
            style: TextStyle(fontSize: 50),
          ),
          style: TextButton.styleFrom(
            primary: Colors.white,
            //COR DE FUNDO
            backgroundColor: Colors.grey[700],
            //side ALTERA COR DA BORDA DO BATÃO
            side: BorderSide(color: Colors.grey[700]),
            //SHAPE ALTERA A BORDA DO BOTAO
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero),
            ),
          ),
        ),
      ),
    );
  }

  Widget botaoApagar(txt, TextEditingController controladorVisor,
      TextEditingController controladorVisorSecundario) {
    return Expanded(
      child: Container(
        width: 90,
        height: 100,
        child: TextButton(
          onPressed: () {
            controladorVisor.text = "";
            controladorVisorSecundario.text = "";
          },
          child: Text(
            txt,
            style: TextStyle(fontSize: 50),
          ),
          style: TextButton.styleFrom(
            primary: Colors.white,
            //COR DE FUNDO
            backgroundColor: Colors.grey[800],
            //side ALTERA COR DA BORDA DO BATÃO
            side: BorderSide(color: Colors.grey[800]),
            //SHAPE ALTERA A BORDA DO BOTAO
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero),
            ),
          ),
        ),
      ),
    );
  }

  Widget botaoIgual(txt, TextEditingController controladorVisor,
      TextEditingController controladorVisorSecundario) {
    return Expanded(
      child: Container(
        width: 90,
        height: 100,
        child: TextButton(
          onPressed: () {
            controladorVisor.text = controladorVisorSecundario.text;
            controladorVisorSecundario.text = "";
          },
          child: Text(
            txt,
            style: TextStyle(fontSize: 50),
          ),
          style: TextButton.styleFrom(
            primary: Colors.white,
            //COR DE FUNDO
            backgroundColor: Colors.grey[700],
            //side ALTERA COR DA BORDA DO BATÃO
            side: BorderSide(color: Colors.grey[700]),
            //SHAPE ALTERA A BORDA DO BOTAO
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero),
            ),
          ),
        ),
      ),
    );
  }

  Widget botaoAcao(txt, TextEditingController controladorVisor,
      TextEditingController controladorVisorSecundario) {
    return Expanded(
      child: Container(
        width: 90,
        height: 100,
        child: TextButton(
          onPressed: () {
            controladorVisor.text += txt;
          },
          child: Text(
            txt,
            style: TextStyle(fontSize: 50),
          ),
          style: TextButton.styleFrom(
            primary: Colors.white,
            //COR DE FUNDO
            backgroundColor: Colors.grey[800],
            //side ALTERA COR DA BORDA DO BATÃO
            side: BorderSide(color: Colors.grey[800]),
            //SHAPE ALTERA A BORDA DO BOTAO
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero),
            ),
          ),
        ),
      ),
    );
  }

  Widget visorPrincipal(controladorVisor) {
    return TextFormField(
      textAlign: TextAlign.end,
      readOnly: false,
      showCursor: true,
      style: TextStyle(fontSize: 60),
      decoration: InputDecoration(border: InputBorder.none),
      controller: controladorVisor,
    );
  }

  Widget visorSecundario(controladorVisor) {
    return TextFormField(
      textAlign: TextAlign.end,
      readOnly: true,
      style: TextStyle(fontSize: 30),
      decoration: InputDecoration(border: InputBorder.none),
      controller: controladorVisor,
    );
  }

  calcular(controladorVisor) {
    Parser p = new Parser();
    Expression exp = p.parse(controladorVisor.text);
    String result = exp
        .evaluate(EvaluationType.VECTOR, null)
        .toString(); // if context is not available replace it with null.
    return result;
  }
}
