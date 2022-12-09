import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuiz;
  Resultado(this.pontuacao, this.reiniciarQuiz);

  String get mensagemResultado {
    if (pontuacao < 40) {
      return 'Parabéns você fez ${pontuacao} pontos. \n       Mas melhore, Ta bom?';
    } else if (pontuacao < 50) {
      return '            Fez ${pontuacao} pontos? \n   Tu é fera mesmo oh macho';
    } else {
      return "Valeu viado... ${pontuacao} pontos";
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
            style: TextStyle(fontSize: 18),
          ),
        ),
        FloatingActionButton.large(
          child: Text('Bora'),
          onPressed: reiniciarQuiz,
        ),
      ],
    );
  }
}
