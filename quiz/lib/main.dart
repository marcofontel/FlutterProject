import 'package:flutter/material.dart';
import 'package:quiz/questionario.dart';
import 'package:quiz/resultado.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      "texto": "Qual sua cor favorita:",
      "respostas": [
        {'texto': 'Vermelho', 'pontuacao': 10},
        {'texto': 'Rosa', 'pontuacao': 20},
        {'texto': 'Roxo', 'pontuacao': 30},
        {'texto': 'Amarelo', 'pontuacao': 40},
      ],
    },
    {
      "texto": "Qual é o seu animal favorito",
      "respostas": [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 20},
        {'texto': 'Morcego', 'pontuacao': 30},
        {'texto': 'Macaco', 'pontuacao': 40},
      ],
    },
    {
      "texto": "Qual é o seu instrutor favorito",
      "respostas": [
        {'texto': 'Manoel', 'pontuacao': 11},
        {'texto': 'Raimundo', 'pontuacao': 21},
        {'texto': 'Rodrigo', 'pontuacao': 31},
        {'texto': 'Romario', 'pontuacao': 41},
      ],
    }
  ];
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print("Total");
    print(_pontuacaoTotal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text('Perguntas')),
      body: temPerguntaSelecionada
          ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              responder: _responder,
            )
          : Resultado(),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
