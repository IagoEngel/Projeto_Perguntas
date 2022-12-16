import 'package:flutter/material.dart';
import 'constants/elevated_button_style.dart';
import 'constants/text_styles.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function(String) reiniciarQuestionario;

  const Resultado({
    super.key,
    required this.pontuacao,
    required this.reiniciarQuestionario,
  });

  String get textoResultado {
    if (pontuacao < 8) {
      return 'Parabéns';
    } else if (pontuacao < 12) {
      return 'Você é bom';
    } else if (pontuacao < 16) {
      return 'Impressionante!!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            textoResultado,
            style: kTitulo,
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          style: kElevatedButton,
          onPressed: () => reiniciarQuestionario('reiniciou'),
          child: const Text(
            'Reiniciar?',
            style: kSubtitulo,
          ),
        ),
      ],
    );
  }
}
