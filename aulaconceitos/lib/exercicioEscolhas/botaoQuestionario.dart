import 'package:flutter/material.dart';

class botaoQuestionario extends StatelessWidget {
  final String textoPersonalizado;
  final Function(String valor) callback;

  botaoQuestionario(this.textoPersonalizado, this.callback);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () =>
            {callback(textoPersonalizado), print(textoPersonalizado)},
        child: Text(textoPersonalizado));
  }
}
