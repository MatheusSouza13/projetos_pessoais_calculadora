import 'package:math_expressions/math_expressions.dart';


void apagarUm(controladorVisorPrincipal, controladorVisorResultado) {
    if (controladorVisorPrincipal.text.length > 1) {
      controladorVisorPrincipal.text = controladorVisorPrincipal.text
          .substring(0, controladorVisorPrincipal.text.length - 1);

      if (verificaUltimoChar(controladorVisorPrincipal)) {
        controladorVisorResultado.text = "";
      } else {
        controladorVisorResultado.text = calcular(controladorVisorPrincipal);
      }
    } else {
      controladorVisorPrincipal.text = "";
      controladorVisorResultado.text = "";
    }
  }

  //A FUNÇÃO RETORNARÁ TRUE CASO O ULTIMO CHAR SEJA UM SIMBOLO
  bool verificaUltimoChar(controladorVisorPrincipal) {
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

  String calcular(controladorVisor) {
  Parser p = new Parser();
  Expression exp = p.parse(controladorVisor.text);
  String result = exp
      .evaluate(EvaluationType.VECTOR, null)
      .toString(); // if context is not available replace it with null.
  return result;
}