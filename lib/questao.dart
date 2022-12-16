import 'package:flutter/material.dart';
import 'constants/text_styles.dart';

class Questao extends StatelessWidget {
  final String texto;

  const Questao(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        texto,
        style: kTitulo,
        textAlign: TextAlign.center,
      ),
    );
  }
}
