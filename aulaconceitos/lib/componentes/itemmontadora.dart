import 'package:aulaconceitos/models/montadora.dart';
import 'package:aulaconceitos/telas/telaveiculos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemMontadora extends StatelessWidget {
  final Montadora montadora;

  const ItemMontadora(this.montadora);

  void selecionaVeiculos(BuildContext context) {
    //push de tela,sobrepor uma tela em cima da outra
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return TelaVeiculos(montadora);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selecionaVeiculos(context);
      },
      child: Container(
        padding: EdgeInsets.all(13),
        child: Text(montadora.nome),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              Colors.green.withOpacity(0.5),
              Colors.amber.shade200
            ])),
      ),
    );
  }
}
