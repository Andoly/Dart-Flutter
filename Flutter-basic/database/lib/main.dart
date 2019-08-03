import 'package:database/modelos/Usuario.dart';
import 'package:database/ui/auxiliar_bd.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

void main() async{
  var db = new BDadosAuxilio();
  
  int usuarioSalvo = await db.inserirUsuario(new Usuario("Andoly", "senha#321"));
  int contagem = await db.coletaContagem();

  //print("Usuario: $usuarioSalvo");

  Usuario Andoly = await db.extrairUsuario(1);

  debugPrint("Usuario: ${Andoly.senha}");

  runApp(
    new Home()
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Database'),
          backgroundColor: Colors.black38,
        ),
      ),
    );
  }
}


