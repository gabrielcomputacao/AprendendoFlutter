import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './botaoQuestionario.dart';

main() {
  runApp(new AulaFlutterConceitos());
}

void onPressed() {
  print('ola amigos');
}

class AulaFlutterConceitos extends StatefulWidget {
  @override
  WidgetConceitosEstado createState() {
    return WidgetConceitosEstado();
  }
  //metodo cria a acao do estado,poder manipular estado
}

class WidgetConceitosEstado extends State<AulaFlutterConceitos> {
  var nadador = "";
  void capturarEscolhasUsuario(String valor) {
    setState(() {
      nadador = valor;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Quiz esportivo'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Color.fromRGBO(255, 0, 0, 1),
            child: Text(
              'QUiz esportivo!!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
              child: Text('Qual seu nadador favorito??',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 20))),
          ElevatedButton(
              onPressed: () {
                capturarEscolhasUsuario('gabriel Medina');
                print("seu nadador e : ${nadador}");
              },
              child: Text('Gabriel Medina', textAlign: TextAlign.left)),
          ElevatedButton(
              onPressed: () {
                capturarEscolhasUsuario('Micael Felps');
                print("seu nadador e : ${nadador}");
              },
              child: Text('Micael Felps')),
          Container(
              child: Text('Qual seu jogador favorito??',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 20))),
          botaoQuestionario("Neymar", capturarEscolhasUsuario),
          botaoQuestionario("José", capturarEscolhasUsuario),
          Container(
              child: Text('Qual seu esporte favorito??',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 20))),
          botaoQuestionario("futebol", capturarEscolhasUsuario),
          botaoQuestionario("boliche", capturarEscolhasUsuario),
          Container(
              child: Text('Qual seu estilo favorito??',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 20))),
          botaoQuestionario("água", capturarEscolhasUsuario),
          botaoQuestionario("terra", capturarEscolhasUsuario),
          Container(
              child: Text('Qual seu time do coração ??',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 20))),
          botaoQuestionario("Atletico", capturarEscolhasUsuario),
          botaoQuestionario("Cruzeiro", capturarEscolhasUsuario),
          Container(
              child: Text('Prefere ver jogo ou ouvir??',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 20))),
          botaoQuestionario("Ouvir", capturarEscolhasUsuario),
          botaoQuestionario("Ver", capturarEscolhasUsuario),
          Container(
              child: Text('Quem é o maior jogador de futebol??',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 20))),
          botaoQuestionario("pelé", capturarEscolhasUsuario),
          botaoQuestionario("Maradona", capturarEscolhasUsuario),
          Container(
              child: Text('Quem foi jogadora de basquete??',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 20))),
          botaoQuestionario("Hortecia", capturarEscolhasUsuario),
          botaoQuestionario("cleudis", capturarEscolhasUsuario),
          Container(
              child: Text('Qual o material da medalha de 1° colocado??',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 20))),
          botaoQuestionario("Lata", capturarEscolhasUsuario),
          botaoQuestionario("Ouro", capturarEscolhasUsuario),
          Container(
              child: Text('Onde foi a copa de 2014 de futebol??',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 20))),
          botaoQuestionario("Holanda", capturarEscolhasUsuario),
          botaoQuestionario("Brasil", capturarEscolhasUsuario),
        ],
      ),
    ));
  }
}

/* tipo estatico dos elementos
class AulaFlutterConceitos extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "aulinha",
        home: Scaffold(
          appBar: AppBar(
            title: Text('Atividade widgets'),
          ),
          body: Column(
            children: [
              TextField(
                decoration: const InputDecoration(hintText: 'digite seu signo'),
              ),
              ElevatedButton(
                  onPressed: onPressed, child: Center(child: Text('verificar')))
            ],
          ),
        ));
  }
}
*/
