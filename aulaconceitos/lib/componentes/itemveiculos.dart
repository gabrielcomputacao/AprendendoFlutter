import 'package:aulaconceitos/models/montadora.dart';
import 'package:aulaconceitos/models/veiculo.dart';
import 'package:flutter/material.dart';

class ItemVeiculo extends StatelessWidget {
  final Veiculo veiculo;
  final Montadora mont;

  const ItemVeiculo(this.veiculo, this.mont);

  @override
  Widget build(BuildContext context) {
    Veiculo veiculoReceber = retornaCarro(mont.id, veiculo);

    return Container(
      child: Text(veiculoReceber.nome +
          "  " +
          veiculoReceber.id_montadora +
          " " +
          veiculoReceber.valor.toString() +
          " " +
          veiculoReceber.id),
    );
  }
}

Veiculo retornaCarro(String id, Veiculo veiculo) {
  Veiculo veiculoAux = new Veiculo('', '', '', 0, '');
  if (veiculo.id_montadora == id) {
    veiculoAux = veiculo;
  }
  return veiculoAux;
}
