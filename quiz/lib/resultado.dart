import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuiz;
  Resultado(this.pontuacao, this.reiniciarQuiz);

  String get mensagemResultado {
    if (pontuacao < 40) {
      return 'Parabéns!!';
    } else if (pontuacao > 50) {
      return 'Você é fera mesmo oh macho';
    } else {
      return "Valeu viado...";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            mensagemResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        FloatingActionButton.large(
          child: Text('Reiniciar'),
          onPressed: reiniciarQuiz,
        ),
      ],
    );
  }
}
