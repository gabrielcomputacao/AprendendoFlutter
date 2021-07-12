import 'package:aulaconceitos/models/montadora.dart';
import 'package:aulaconceitos/providers/montadoras_antes_firebase.dart';
import 'package:aulaconceitos/utils/rotas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemListaMontadora extends StatelessWidget {
  final Montadora montadora;

  ItemListaMontadora(this.montadora);

  void deleteMontadora(context, Montadora montadora) {
    Provider.of<MontadoraProvider>(context, listen: false)
        .deleteMontadora(montadora);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.amber.shade300,
      title: Container(
        child: Text(
          montadora.nome,
          style: TextStyle(color: Colors.white),
        ),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                //ao chamar o form pelo editar envio os argumentos da montadora
                Navigator.of(context).pushNamed(
                  Rotas.FORM_MONTADORA,
                  arguments: montadora,
                );
              },
              icon: Icon(Icons.edit),
              color: Colors.grey,
            ),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text('Atenção!!!!'),
                          content: Text("tem certeza?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("não")),
                            TextButton(
                                onPressed: () {
                                  deleteMontadora(context, montadora);
                                  Navigator.of(context).pop();
                                },
                                child: Text('sim'))
                          ],
                        ));
              },
              icon: Icon(Icons.delete),
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
