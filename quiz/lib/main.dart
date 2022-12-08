import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final perguntas = [
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
    setState(() {
      _perguntaSelecionada++;
    });
  }

  List<Widget> listaResp = [];
  @override
  Widget build(BuildContext context) {
    for (String a in perguntas[_perguntaSelecionada]['respostas'] as List) {
      listaResp.add(Resposta(a, _responder));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Perguntas')),
        body: Column(
          children: [
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            ...listaResp
          ],
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
