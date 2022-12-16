import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final Function(int) responder;

  const Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        const SizedBox(height: 10),
        // ...widgets, //ABORDAGEM IMPERATIVA
        ...respostas.map(
          (resposta) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Resposta(
                resposta['texto'] as String,
                () => responder(resposta['pontuacao'] as int),
              ),
            );
          },
        ).toList(), //ABORDAGEM DECLARATIVA
      ],
    );
  }
}
