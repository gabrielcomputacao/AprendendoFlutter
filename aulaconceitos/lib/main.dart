import 'package:aulaconceitos/providers/montadoras_antes_firebase.dart';
import 'package:aulaconceitos/telas/telaCadastroMontadoras.dart';
import 'package:aulaconceitos/telas/telaForm.dart';
import 'package:aulaconceitos/telas/telaLogin.dart';
import 'package:aulaconceitos/telas/telamontadora.dart';
import 'package:aulaconceitos/telas/telaveiculos.dart';
import 'package:aulaconceitos/utils/rotas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MontadoraProvider(),
        child: MaterialApp(
          title: 'Flutter Montadora',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            Rotas.AUTH: (context) => TelaLogin(),
            Rotas.HOME: (context) => TelaMontadora(),
            Rotas.CAD_MONTADORAS: (context) => TelaCadastoMontadora(),
            Rotas.FORM_MONTADORA: (context) => TelaFormMontadora(),
          },
          onUnknownRoute: (settings) {
            /* caso nao encontre rota nenhuma */
            print('nao encontrado');
            return null;
          },
          onGenerateRoute: (settings) {
            print(settings.name);
            return null;
          },
        ));
  }
}
