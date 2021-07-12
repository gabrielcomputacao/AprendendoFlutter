import 'package:aulaconceitos/models/veiculo.dart';
import 'package:flutter/material.dart';

class Montadora {
  final String id;
  final String nome;
  final String cor;
  final List<Veiculo> veiculos;

  const Montadora({
    @required this.id,
    @required this.nome,
    this.cor = "verde",
    this.veiculos,
  });
}
