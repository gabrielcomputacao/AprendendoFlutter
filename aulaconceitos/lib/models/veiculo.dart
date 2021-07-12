import 'package:flutter/material.dart';

class Veiculo {
  final String id;
  final String id_montadora;
  final String nome;
  final double valor;
  final String imagem; //caminho da imagem na web

  const Veiculo(this.id, this.id_montadora, this.nome, this.valor, this.imagem);
}
