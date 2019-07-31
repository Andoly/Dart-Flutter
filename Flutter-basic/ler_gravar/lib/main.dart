import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart'; //path_provideris a plugin responsible for forwarding directory
import 'dart:io';
import 'dart:async';

void main() {
  runApp(
      new MaterialApp(
        title : 'I/O',
        home: Home(),
      )
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _campoDadosControl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leitura/Gravação"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Container(
        //padding: const EdgeInsets.all(13.4),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            TextField(
              controller: _campoDadosControl,
              decoration: InputDecoration(labelText: "ESCREVA ALGO "),
            ),
            Padding(padding: const EdgeInsets.all(15.0)),
            FlatButton(
                color: Colors.greenAccent,
                onPressed: (){
                  gravarDados(_campoDadosControl.text);
            },child: Text('Salvar')),
            FutureBuilder(
                future: lerDados(),
                builder: (BuildContext context, AsyncSnapshot<String> dados){
                  if (dados.hasData != null){
                      return Text(
                        dados.data,
                        style: TextStyle(
                          color: Colors.pinkAccent
                        ),
                      );
                  }else{
                        return Text("Nenhuma informação salva")
                  }
                })
          ],
        ),
      )
    );
  }

}
Future<String> get _caminhoLocal async{
  final diretorio = await getApplicationDocumentsDirectory();
  return diretorio.path; //home /diretory/
}
Future<File> get _arquivoLocal async{
  final caminho = await _caminhoLocal;

  return new File('caminho/dados.txt');
}
Future<File> gravarDados(String mensagem) async{
  final arquivo = await _arquivoLocal;

  return  arquivo.writeAsString('$mensagem');
}
Future<String> lerDados() async{
  try {
    final arquivo = await _arquivoLocal;
    return await arquivo.readAsString();
  }catch(e){
    return "Não há informações salvas";
  }
}