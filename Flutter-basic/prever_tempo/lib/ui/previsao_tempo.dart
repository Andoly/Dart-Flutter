import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Previsao_tempo extends StatefulWidget {
  @override
  _Previsao_tempoState createState() => _Previsao_tempoState();
}

class _Previsao_tempoState extends State<Previsao_tempo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Previsão do tempo'),
        backgroundColor: Colors.amberAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.menu),
              onPressed: () => null)
        ],
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset('assets/umbrella.png',
            width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,),
          ),
          Container(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("Olá Goiânia"),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset('assets/light-rain.png'),
          )
        ],
      )
    );
  }
}
