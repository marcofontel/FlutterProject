import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final List<Map> _perguntas = const [
    {
      "texto": "Qual sua cor favorita:",
      "respostas": ['Vermelho', 'Rosa', 'Roxo', 'Amarelo'],
    },
    {
      "texto": "Qual é o seu animal favorito",
      "respostas": ['Coelho', 'Cobra', 'Morcego', 'Macaco'],
    },
    {
      "texto": "Qual é o seu instrutor favorito",
      "respostas": ['Manoel', 'Raimundo', 'Rodrigo', 'Romario'],
    }
  ];
  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas'] as List<String>
        : [];

    var quest = _perguntas[_perguntaSelecionada]['texto'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Perguntas')),
        body: temPerguntaSelecionada
            ? Column(
                children: [
                  Questao(quest.toString()),
                  ...respostas
                      .map((e) => Resposta(e.toString(), _responder))
                      .toList()
                ],
              )
            : const Center(
                child: Text(
                  'Parabéns',
                  style: TextStyle(fontSize: 28),
                ),
              ),
      ),
    );
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
