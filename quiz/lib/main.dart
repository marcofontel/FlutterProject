import 'package:flutter/material.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  final perguntas = [
    'Qual é a sua cor favorita?',
    'Qual é o seu animal favorito?'
  ];
  void _responder() {
    perguntaSelecionada++;
    print(perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Perguntas')),
        body: Column(
          children: [
            Text(perguntas[perguntaSelecionada]),
            ElevatedButton(
              child: Text('Resposta 1'),
              onPressed: _responder,
            ),
            ElevatedButton(
              child: Text('Resposta 2'),
              onPressed: _responder,
            ),
            ElevatedButton(
              child: Text('Resposta 3'),
              onPressed: _responder,
            )
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
