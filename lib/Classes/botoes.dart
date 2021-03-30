import 'package:flutter/material.dart';
import 'package:app_calculadora03/Funcoes/functions.dart';

class BotaoNumerico extends StatelessWidget {
  final String txt;
  final TextEditingController controladorVisorPrincipal;
  final TextEditingController controladorVisorSecundario;

  const BotaoNumerico(
    this.txt,
    this.controladorVisorPrincipal,
    this.controladorVisorSecundario,
  );

  @override
  Widget build(BuildContext context) {
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
}

class BotaoApagarTudo extends StatelessWidget {
  final String txt;
  final TextEditingController controladorVisorPrincipal;
  final TextEditingController controladorVisorSecundario;

  const BotaoApagarTudo(
    this.txt,
    this.controladorVisorPrincipal,
    this.controladorVisorSecundario,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        child: TextButton(
          onPressed: () {
            controladorVisorPrincipal.text = "";
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
}

class BotaoApagarUltimoDigito extends StatelessWidget {
  final TextEditingController controladorVisorPrincipal;
  final TextEditingController controladorVisorResultado;

  const BotaoApagarUltimoDigito(
    this.controladorVisorPrincipal,
    this.controladorVisorResultado,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      // padding: EdgeInsets.only(right: 20),
      child: TextButton(
        onPressed: () {
          apagarUm(controladorVisorPrincipal, controladorVisorResultado);
        },
        child: Icon(Icons.backspace_outlined, size: 35),
        style: TextButton.styleFrom(primary: Colors.white),
      ),
    );
  }
}

class BotaoIgual extends StatelessWidget {
  final String txt;
  final TextEditingController controladorVisorPrincipal;
  final TextEditingController controladorVisorResultado;

  const BotaoIgual(
    this.txt,
    this.controladorVisorPrincipal,
    this.controladorVisorResultado,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        child: TextButton(
          onPressed: () {
            //Se o ultimo char for um simbolo. Apaga o ultimo char e exibe o cálculo na tela
            if (verificaUltimoChar(controladorVisorPrincipal)) {
              apagarUm(controladorVisorPrincipal, controladorVisorResultado);
              controladorVisorPrincipal.text =
                  calcular(controladorVisorPrincipal);
              controladorVisorResultado.text = "";
            }
            //Se o ultimo char NÃO for um simbolo. Manda o valor do visorSecundário para o visorPrincipal
            //e apaga o visorSecundário
            else {
              controladorVisorPrincipal.text =
                  calcular(controladorVisorPrincipal);
              controladorVisorResultado.text = "";
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
}

class BotaoSimbolo extends StatelessWidget {
  final String txt;
  final TextEditingController controladorVisorPrincipal;
  final TextEditingController controladorVisorResultado;

  const BotaoSimbolo(
    this.txt,
    this.controladorVisorPrincipal,
    this.controladorVisorResultado,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        child: TextButton(
          onPressed: () {
            //CASO O ULTIMO CHAR SEJA UM SIMBOLO. APAGA O ULTIMO SIMBOLO E SUBSTITUI PELO SIMBOLO PRESSIONADO
            if (verificaUltimoChar(controladorVisorPrincipal)) {
              apagarUm(controladorVisorPrincipal, controladorVisorResultado);
              controladorVisorPrincipal.text += txt;
              controladorVisorResultado.text = "";
            }
            //CASO O ULTIMO CHAR NÃO SEJA UM SIMBOLO. APENAS ADICIONA O SIMBOLO PRESSIONADO
            else {
              controladorVisorPrincipal.text += txt;
              controladorVisorResultado.text = "";
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
}

class BotaoPonto extends StatelessWidget {
  final String txt;
  final TextEditingController controladorVisorPrincipal;
  final TextEditingController controladorVisorResultado;

  const BotaoPonto(
    this.txt,
    this.controladorVisorPrincipal,
    this.controladorVisorResultado,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        child: TextButton(
          onPressed: () {
            if (controladorVisorPrincipal.text.isEmpty ||
                verificaUltimoChar(controladorVisorPrincipal)) {
              controladorVisorPrincipal.text += "0.";
            }
            //CASO O ULTIMO CHAR NÃO SEJA UM SIMBOLO. APENAS ADICIONA O SIMBOLO PRESSIONADO
            else {
              controladorVisorPrincipal.text += txt;
              controladorVisorResultado.text = "";
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
}
