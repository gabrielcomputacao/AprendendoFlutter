import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login with ChangeNotifier {
  Future<void> registrar(String email, String senha) async {
    final url = Uri.https("authority", "unencodedPath");

    final resposta = await http.post(
      url,
      body: json.encode({
        "email": email,
        "password": senha,
        "returnSecureToken": true,
      }),
    );
    print(json.decode(resposta.body));
    return Future.value();
  }

  Future<void> realizarLogin(String email, String senha) async {
    final url = Uri.https("authority", "unencodedPath)");

    final resposta = await http.post(
      url,
      body: json.encode({
        "email": email,
        "password": senha,
        "returnSecureToken": true,
      }),
    );

    final respostaAutenticacao = json.decode(resposta.body);
    if (respostaAutenticacao['erro'] != null) {
      throw Exception(respostaAutenticacao['erro']);
    }
    return Future.value(json.decode(resposta.body));
  }
}
