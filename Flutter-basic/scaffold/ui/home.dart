import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold-andaime"),
        backgroundColor: Colors.orangeAccent,
        actions: <Widget>[
          IconButton(icon: new Icon(Icons.accessible), onPressed: () => debugPrint("Bem vindo")), // Passando retorno da função faz com que o icone seja clicável
          IconButton(icon: new Icon(Icons.print), onPressed: null,),  //Exemplo que o retorno da função é null, logo o icone fica opaco
          IconButton(icon: new Icon(Icons.access_alarm), onPressed: null,)
        ],
      ),
    );
  }
}
