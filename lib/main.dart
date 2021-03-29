import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';

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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            visorPrincipal(controladorVisorPrincipal),
            visorSecundario(controladorVisorSecundario),
            Padding(padding: EdgeInsets.only(top: 30)),
            botaoApagarUm(
                controladorVisorPrincipal, controladorVisorSecundario),
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
                      botaoPonto(".", controladorVisorPrincipal,
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
        width: MediaQuery.of(context).size.width * 0.25,
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
        width: MediaQuery.of(context).size.width * 0.25,
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
        width: MediaQuery.of(context).size.width * 0.25,
        child: TextButton(
          onPressed: () {
            //Se o ultimo char for um simbolo. Apaga o ultimo char e exibe o cálculo na tela
            if (verificaUltimoChar()) {
              _apagarUm(controladorVisor, controladorVisorSecundario);
              controladorVisor.text = calcular(controladorVisor);
              controladorVisorSecundario.text = "";
            }
            //Se o ultimo char NÃO for um simbolo. Manda o valor do visorSecundário para o visorPrincipal
            //e apaga o visorSecundário
            else {
              controladorVisor.text = calcular(controladorVisor);
              controladorVisorSecundario.text = "";
            }
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
        width: MediaQuery.of(context).size.width * 0.25,
        child: TextButton(
          onPressed: () {
            //CASO O ULTIMO CHAR SEJA UM SIMBOLO. APAGA O ULTIMO SIMBOLO E SUBSTITUI PELO SIMBOLO PRESSIONADO
            if (verificaUltimoChar()) {
              _apagarUm(controladorVisor, controladorVisorSecundario);
              controladorVisor.text += txt;
              controladorVisorSecundario.text = "";
            }
            //CASO O ULTIMO CHAR NÃO SEJA UM SIMBOLO. APENAS ADICIONA O SIMBOLO PRESSIONADO
            else {
              controladorVisor.text += txt;
              controladorVisorSecundario.text = "";
            }
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
        controller: controladorVisor,
      ),
    );
  }

  Widget visorSecundario(controladorVisor) {
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
        controller: controladorVisor,
      ),
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

  botaoApagarUm(TextEditingController controladorVisorPrincipal,
      TextEditingController controladorVisorSecundario) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      // padding: EdgeInsets.only(right: 20),
      child: TextButton(
        onPressed: () {
          _apagarUm(controladorVisorPrincipal, controladorVisorSecundario);
        },
        child: Icon(Icons.backspace_outlined, size: 35),
        style: TextButton.styleFrom(primary: Colors.white),
      ),
    );
  }

  Widget botaoPonto(txt, TextEditingController controladorVisor,
      TextEditingController controladorVisorSecundario) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        child: TextButton(
          onPressed: () {
            if (controladorVisor.text.isEmpty || verificaUltimoChar()) {
              controladorVisor.text += "0.";
            }
            //CASO O ULTIMO CHAR NÃO SEJA UM SIMBOLO. APENAS ADICIONA O SIMBOLO PRESSIONADO
            else {
              controladorVisor.text += txt;
              controladorVisorSecundario.text = "";
            }
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

  void _apagarUm(controladorVisorPrincipal, controladorVisorSecundario) {
    if (controladorVisorPrincipal.text.length > 1) {
      controladorVisorPrincipal.text = controladorVisorPrincipal.text
          .substring(0, controladorVisorPrincipal.text.length - 1);

      if (verificaUltimoChar()) {
        controladorVisorSecundario.text = "";
      } else {
        controladorVisorSecundario.text = calcular(controladorVisorPrincipal);
      }
    } else {
      controladorVisorPrincipal.text = "";
      controladorVisorSecundario.text = "";
    }
  }

  //A FUNÇÃO RETORNARÁ TRUE CASO O ULTIMO CHAR SEJA UM SIMBOLO
  bool verificaUltimoChar() {
    if (controladorVisorPrincipal
                .text[controladorVisorPrincipal.text.length - 1] ==
            "+" ||
        controladorVisorPrincipal
                .text[controladorVisorPrincipal.text.length - 1] ==
            "/" ||
        controladorVisorPrincipal
                .text[controladorVisorPrincipal.text.length - 1] ==
            "*" ||
        controladorVisorPrincipal
                .text[controladorVisorPrincipal.text.length - 1] ==
            "-") {
      return true;
    } else {
      return false;
    }
  }
}
