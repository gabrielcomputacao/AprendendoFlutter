import 'package:aulaconceitos/componentes/drawer_personalizado.dart';
import 'package:aulaconceitos/componentes/monttadora_lista.dart';
import 'package:aulaconceitos/providers/montadoras_antes_firebase.dart';
import 'package:aulaconceitos/utils/rotas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaCadastoMontadora extends StatefulWidget {
  @override
  _TelaCadastroMontadoraState createState() => _TelaCadastroMontadoraState();
}

class _TelaCadastroMontadoraState extends State<TelaCadastoMontadora> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    Provider.of<MontadoraProvider>(context, listen: false)
        .buscaMontadoras()
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final montadoras = Provider.of<MontadoraProvider>(context).getMontadoras;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastro Montadoras',
          style: TextStyle(fontSize: 22),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Rotas.FORM_MONTADORA);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: DrawerPersonalizado(),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: montadoras.length,
          itemBuilder: (context, i) => Column(
            children: [
              ItemListaMontadora(montadoras[i]),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
