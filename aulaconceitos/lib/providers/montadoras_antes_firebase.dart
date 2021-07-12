import 'dart:convert';

import 'package:aulaconceitos/mockdata/montadoras.dart';
import 'package:aulaconceitos/models/montadora.dart';
import 'package:aulaconceitos/utils/variaveis.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//padrao OBSERVER: informa a todos interessados(toda aplicacao),ele avisa
//a aplicacao que essa mudanca aconteceu
class MontadoraProvider with ChangeNotifier {
  List<Montadora> _montadoras = MONTADORAS_MOCK.toList();

  List<Montadora> get getMontadoras => [..._montadoras];
  // ... sprad desmembra os itens dentro do array

  void adicionarMontadora(Montadora montadora) {
    _montadoras.add(montadora);
    /* 
      temos efetivamente uma mudanca em nossos dados que estamos adicionando
      um valor a montadora porntante deve informar ao padrao
      que estamos realizando tal mudanca
     */

    notifyListeners();
  }

  //para fazer requisicoes sincronas devemos retornar o future
  Future<void> buscaMontadoras() async {
    var url = Uri.https(Variaveis.BACKURL, '/montadoras.json');
    var resposta = await http.get(url);
    Map<String, dynamic> data = json.decode(resposta.body);
    data.forEach((idMontadora, dadosMontadora) {
      adicionarMontadora(
        Montadora(
            id: idMontadora,
            nome: dadosMontadora['nome'],
            cor: dadosMontadora[Colors.green]),
      );
    });
    notifyListeners();
  }

  Future<void> postMontadora(Montadora montadora) async {
    var url = Uri.https(Variaveis.BACKURL, '/montadoras.json');
    http
        .post(url,
            body: jsonEncode(
              {
                'nome': montadora.nome,
                'cor': montadora.cor,
              },
            ))
        .then((value) {
      buscaMontadoras();
      notifyListeners();
    });
  }

  // Metodo para atualizar montadoras
  Future<void> pachtMontadora(Montadora montadora) async {
    var url = Uri.https(Variaveis.BACKURL, '/montadoras/${montadora.id}.json');
    http
        .patch(url,
            body: jsonEncode(
              {
                'nome': montadora.nome,
                'cor': montadora.cor,
              },
            ))
        .then((value) {
      buscaMontadoras();
      notifyListeners();
    });
  }

  //Metodo para deletar
  Future<void> deleteMontadora(Montadora montadora) async {
    var url = Uri.https(Variaveis.BACKURL, '/montadoras/${montadora.id}.json');
    http.delete(url).then((value) {
      buscaMontadoras();
      notifyListeners();
    });
  }
}
