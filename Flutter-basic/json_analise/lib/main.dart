import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async  {
  List _dados = await getJson();
  String _body = "";

//  //print(dados[0]['name']);
//  for(int i=0; i < _dados.length; i++){
//    debugPrint("Nome : $_dados[i]['name']");
//    debugPrint("ID : $_dados[i]['id']");
//
//  }
  _body = _dados[0]['body'];

  runApp(new MaterialApp(
    home: new Scaffold(
      appBar: new AppBar(
        title: Text("JSON"),
      ),
      body: new Center(
        //Responsável por criar uma lista
        child: new ListView.builder(
          itemCount: _dados.length,
          padding: const EdgeInsets.all(14.5),
          itemBuilder: (BuildContext context, int posicao){
            return Column(
              children: <Widget>[
                Divider(height: 5.5,),
                ListTile(
                  title: Text(
                    "${_dados[posicao]['email']}"
                  ),
                  subtitle: Text(
                    "${_dados[posicao]['body']}"
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.greenAccent,
                    child: Text(
                      "${_dados[posicao]['email'][0]}"
                    ),
                  ),
                  onTap:() => _mostrarMensagem(context, _dados[posicao]['body']),
                )
              ],
            );
          },
        ),
      ),
    ),
  ));
}

void _mostrarMensagem(BuildContext context, String mensagem) {
  var alert = new AlertDialog(
    title: Text('JSON'),
    content: Text(mensagem),
    actions: <Widget>[
      Center(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Voltar"),
            ),
          ),
        ],
      ),
      )

    ],
  );
  showDialog(context: context, builder: (context) => alert);
}

Future<List> getJson() async {
  String url = 'https://jsonplaceholder.typicode.com/comments';

  http.Response response = await http.get(url);
  if(response.statusCode == 200) {
    return json.decode(response.body);
  }
  else {
    throw Exception("Falha na solicitação");
  }
}
