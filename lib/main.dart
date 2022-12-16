import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Vermelho', 'pontuacao': 10},
        {'texto': 'Roxo', 'pontuacao': 8},
        {'texto': 'Preto', 'pontuacao': 6},
        {'texto': 'Laranja', 'pontuacao': 4},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Orangotango', 'pontuacao': 4},
        {'texto': 'Naja', 'pontuacao': 6},
        {'texto': 'Peixe-Bolha', 'pontuacao': 8},
        {'texto': 'Lacraia', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Qual é o seu intrutor favorito?',
      'respostas': [
        {'texto': 'Iago', 'pontuacao': 10},
        {'texto': 'Felipe', 'pontuacao': 0},
        {'texto': 'João', 'pontuacao': 3},
        {'texto': 'Kleber', 'pontuacao': 4},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _reiniciarQuestionario(String t) {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
    debugPrint(t);
  }

  @override
  Widget build(BuildContext context) {
    //ABORDAGEM IMPERATIVA
    // final List<Widget> widgets = [];

    // for(String r in perguntas[_perguntaSelecionada].cast()['respostas']){
    //   widgets.add(Resposta(r, _responder));
    // }

    //ABORDAGEM DECLARATIVA
    // final List<String> respostas = temPerguntaSelecionada
    //     ? _perguntas[_perguntaSelecionada].cast()['respostas']
    //     : [];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.question_answer),
          backgroundColor: Colors.indigo,
          title: const Text(
            'PERGUNTAS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1
            ),
          ),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : Resultado(
                pontuacao: _pontuacaoTotal,
                reiniciarQuestionario: _reiniciarQuestionario),
      ),
    );
  }
}
