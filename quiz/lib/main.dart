import 'package:flutter/material.dart';
import 'package:quiz/questionario.dart';
import 'package:quiz/resultado.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      "texto": "Qual sua cor favorita:",
      "respostas": [
        {'texto': 'Vermelho', 'nota': 10},
        {'texto': 'Rosa', 'nota': 23},
        {'texto': 'Roxo', 'nota': 34},
        {'texto': 'Amarelo', 'nota': 47},
      ],
    },
    {
      "texto": "Qual é o seu animal favorito",
      "respostas": [
        {'texto': 'Coelho', 'nota': 10},
        {'texto': 'Cobra', 'nota': 21},
        {'texto': 'Morcego', 'nota': 33},
        {'texto': 'Macaco', 'nota': 46},
      ],
    },
    {
      "texto": "Qual é o seu instrutor favorito",
      "respostas": [
        {'texto': 'Manoel', 'nota': 11},
        {'texto': 'Raimundo', 'nota': 21},
        {'texto': 'Rodrigo', 'nota': 31},
        {'texto': 'Romario', 'nota': 41},
      ],
    }
  ];
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
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
