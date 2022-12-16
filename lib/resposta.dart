import 'package:flutter/material.dart';
import 'constants/text_styles.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onPressed;

  const Resposta(this.texto, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo,
          textStyle: kSubtitulo,
        ),
        onPressed: onPressed,
        child: Text(texto),
      ),
    );
  }
}
