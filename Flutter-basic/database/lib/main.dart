import 'package:database/modelos/Usuario.dart';
import 'package:database/ui/auxiliar_bd.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

List _todosUsuarios;
void main() async{
  var db = new BDadosAuxilio();
  /*
  int usuarioSalvo = await db.inserirUsuario(new Usuario("Andoly", "senha#321"));
  int contagem = await db.coletaContagem();

  //print("Usuario: $usuarioSalvo");

  Usuario Andoly = await db.extrairUsuario(1);

  debugPrint("Usuario: ${Andoly.senha}");
  */
  //await db.inserirUsuario(new Usuario("Angela", "leandrollll"));

  //Todos usuarios
  _todosUsuarios = await db.extrairUsuarios();
  for (int i = 0; i < _todosUsuarios.length; i++) {
    Usuario usuario = Usuario.map(_todosUsuarios[i]);
    debugPrint("Usuario: ${usuario.nome}, Id: ${usuario.id}");

  }
  runApp(new Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('BaseDados'),
          backgroundColor: Colors.black38,
        ),
        body: ListView.builder(
            itemCount: _todosUsuarios.length,
            itemBuilder: (_, int posicao) {
              return Card(
                color: Colors.white,
                elevation: 2.0,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text("${Usuario.from((_todosUsuarios[posicao]).nome.substring(0,1)}"),
                  ),
                  title: Text("Usuario: ${Usuario.from((_todosUsuarios[posicao]).nome}"),
                  subtitle: Text("Id: ${Usuario.from(_todosUsuarios[posicao]).id}"),

                  onTap: () => debugPrint("Senha: ${Usuario.from(_todosUsuarios[posicao]).senha}"),
                ),
              );

            }),
      ),
    );
  }
}

