import 'package:app_calculadora03/Classes/botoes.dart';
import 'package:app_calculadora03/Classes/visores.dart';
import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  final TextEditingController controladorVisorPrincipal =
      TextEditingController();
  final TextEditingController controladorVisorResultado =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            VisorPrincipal(controladorVisorPrincipal),
            VisorResultado(controladorVisorResultado),
            Padding(padding: EdgeInsets.only(top: 30)),
            BotaoApagarUltimoDigito(
                controladorVisorPrincipal, controladorVisorResultado),
            Flexible(
              child: Row(
                children: [
                  //COLUNA 7 4 1 .
                  Column(
                    children: [
                      BotaoNumerico("7", controladorVisorPrincipal,
                          controladorVisorResultado),
                      BotaoNumerico("4", controladorVisorPrincipal,
                          controladorVisorResultado),
                      BotaoNumerico("1", controladorVisorPrincipal,
                          controladorVisorResultado),
                      BotaoPonto(".", controladorVisorPrincipal,
                          controladorVisorResultado),
                    ],
                  ),

                  //COLUNA 8 5 2 0
                  Column(
                    children: [
                      BotaoNumerico("8", controladorVisorPrincipal,
                          controladorVisorResultado),
                      BotaoNumerico("5", controladorVisorPrincipal,
                          controladorVisorResultado),
                      BotaoNumerico("2", controladorVisorPrincipal,
                          controladorVisorResultado),
                      BotaoNumerico("0", controladorVisorPrincipal,
                          controladorVisorResultado),
                    ],
                  ),
                  //COLUNA 9 6 3 =
                  Column(
                    children: [
                      BotaoNumerico("9", controladorVisorPrincipal,
                          controladorVisorResultado),
                      BotaoNumerico("6", controladorVisorPrincipal,
                          controladorVisorResultado),
                      BotaoNumerico("3", controladorVisorPrincipal,
                          controladorVisorResultado),
                      BotaoIgual("=", controladorVisorPrincipal,
                          controladorVisorResultado),
                    ],
                  ),

                  //COLUNA 9 6 3 =
                  Column(
                    children: [
                      BotaoApagarTudo("C", controladorVisorPrincipal,
                          controladorVisorResultado),
                      BotaoSimbolo("/", controladorVisorPrincipal,
                          controladorVisorResultado),
                      BotaoSimbolo("*", controladorVisorPrincipal,
                          controladorVisorResultado),
                      BotaoSimbolo("-", controladorVisorPrincipal,
                          controladorVisorResultado),
                      BotaoSimbolo("+", controladorVisorPrincipal,
                          controladorVisorResultado),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
