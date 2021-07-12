import 'package:aulaconceitos/componentes/drawer_personalizado.dart';
import 'package:aulaconceitos/componentes/itemmontadora.dart';
import 'package:aulaconceitos/mockdata/montadoras.dart';
import 'package:flutter/material.dart';

class TelaMontadora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolha a montadora'),
      ),
      drawer: DrawerPersonalizado(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue[50],
        selectedItemColor: Colors.white10,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.car_rental), label: "montadoras"),
          BottomNavigationBarItem(icon: Icon(Icons.nat), label: 'configuracoes')
        ],
      ),
      body: GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, //tamanho maximo de cada elemento no grid
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: MONTADORAS_MOCK.map((e) {
          return ItemMontadora(e);
        }).toList(),
      ),
    );
  }
}
