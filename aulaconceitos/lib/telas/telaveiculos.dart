import 'package:aulaconceitos/componentes/itemveiculos.dart';
import 'package:aulaconceitos/mockdata/veiculos.dart';
import 'package:aulaconceitos/models/montadora.dart';
import 'package:flutter/material.dart';

class TelaVeiculos extends StatelessWidget {
  final Montadora montadora;

  const TelaVeiculos(this.montadora);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('veiculos da ${montadora.nome}'),
      ),
      body: GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, //tamanho maximo de cada elemento no grid
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: VEICULO_MOCK.map((e) {
          return ItemVeiculo(e, montadora);
        }).toList(),
      ),
    );
  }
}
