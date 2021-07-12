import 'dart:convert';

import 'package:aulaconceitos/models/montadora.dart';
import 'package:aulaconceitos/providers/montadoras_antes_firebase.dart';
import 'package:aulaconceitos/utils/variaveis.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class TelaFormMontadora extends StatefulWidget {
  @override
  TelaFormMontadoraState createState() => TelaFormMontadoraState();
}

class TelaFormMontadoraState extends State<TelaFormMontadora> {
  final form = GlobalKey<FormState>();
  final dadosForm = Map<String, Object>();

//recebo a montadora como parametro para pegar o id atual
  void saveForm(context, Montadora montadora) {
    var formValido = form.currentState.validate();

    form.currentState.save();

    final novaMontadora = Montadora(
        id: montadora != null ? montadora.id : montadora,
        nome: dadosForm['nome'],
        cor: dadosForm['cor']);

    if (formValido) {
      if (montadora != null) {
        Provider.of<MontadoraProvider>(context, listen: false)
            .pachtMontadora(novaMontadora);
        Navigator.of(context).pop();
      } else {
        Provider.of<MontadoraProvider>(context, listen: false)
            .postMontadora(novaMontadora);
        Navigator.of(context).pop(); /* tira a tela do topo da fila */
      }
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    final montadora = ModalRoute.of(context).settings.arguments as Montadora;
    return Scaffold(
      appBar: AppBar(
        title: Text('formulário Montadora'),
        actions: [
          IconButton(
              onPressed: () => {saveForm(context, montadora)},
              icon: Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: form,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome montadora'),
                textInputAction: TextInputAction.next,
                initialValue: montadora != null ? montadora.nome : '',
                onSaved: (value) {
                  dadosForm['nome'] = value;
                },
                validator: (value) {
                  if (value.toString().trim().isEmpty) {
                    return 'Informe um valor valido';
                  }
                  return null;
                },
              ),
              TextFormField(
                  decoration: InputDecoration(labelText: 'Cor'),
                  textInputAction: TextInputAction.done,
                  initialValue: montadora != null ? montadora.cor : '',
                  onSaved: (value) {
                    dadosForm['cor'] = value;
                  },
                  onFieldSubmitted: (_) {
                    saveForm(context, montadora);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
