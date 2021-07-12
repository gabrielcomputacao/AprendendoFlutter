import 'package:aulaconceitos/utils/rotas.dart';
import 'package:flutter/material.dart';

class DrawerPersonalizado extends StatelessWidget {
  Widget criarItem(IconData icon, String label, Function onTapin) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 23,
        ),
      ),
      onTap: () {
        onTapin();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          color: Colors.lightBlue,
          alignment: Alignment.bottomLeft,
          child: Text(
            'aplicativo top',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        criarItem(
            Icons.car_rental,
            " cadastro montadoras",
            () => Navigator.of(context)
                .pushReplacementNamed(Rotas.CAD_MONTADORAS)),
        criarItem(Icons.nat, "teste", () => print('teste')),
        criarItem(Icons.confirmation_num, "Principal",
            () => Navigator.of(context).pushReplacementNamed(Rotas.HOME))
      ]),
    );
  }
}
