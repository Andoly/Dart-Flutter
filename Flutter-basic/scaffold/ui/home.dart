import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  void botaoFlutuante() => debugPrint("Botao flutuante");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold-andaime"),
        backgroundColor: Colors.orangeAccent,
        actions: <Widget>[
          IconButton(icon: new Icon(Icons.accessible), onPressed: () => debugPrint("Acessibilidade")), // Passando retorno da função faz com que o icone seja clicável
          IconButton(icon: new Icon(Icons.print), onPressed: null,),  //Exemplo que o retorno da função é null, logo o icone fica opaco
          IconButton(icon: new Icon(Icons.access_alarm), onPressed: null,)
        ],
      ),
      backgroundColor: Colors.white70,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Iniciando com flutter",
            style: TextStyle(
              fontSize: 19.5,
              fontWeight: FontWeight.w700,
              color: Colors.black
            )
            )
          ],
        ),
      ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm), title: Text("Alarme")),
          BottomNavigationBarItem(icon:Icon(Icons.print), title: Text("Imprimir"))
        ],),
      floatingActionButton: FloatingActionButton(
          onPressed: botaoFlutuante,
          child: Icon(Icons.add),
          backgroundColor: Colors.deepOrange,

      ),
    );
  }
}
