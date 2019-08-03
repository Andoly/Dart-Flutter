import 'dart:async';
import 'dart:io';

import 'package:database/modelos/Usuario.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class BDadosAuxilio {
  static final BDadosAuxilio _instance =  new BDadosAuxilio.internal();
  factory BDadosAuxilio() => _instance;

  final String tabelaUsuario = "tabelaUsuario";
  final String colunaId = "id";
  final String coluneNome = "Nome";
  final String colunaSenha = "Senha";

  static Database _db;

  Future<Database> get db async{
    if (_db != null){
      return _db;
    }
    _db = await initBD();
    return _db;
  }

  BDadosAuxilio.internal();

  initBD() async {
      Directory documentoDiretorio = await getApplicationDocumentsDirectory();
      String caminho = join(documentoDiretorio.path, "bd_principal.db"); //import 'package:path/path.dart';

    var bDados = await openDatabase(caminho, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async{
          await db.execute("CREATE TABLE $tabelaUsuario($colunaId INTEGER PRIMARY KEY,"
          "$coluneNome TEXT,"
          "$colunaSenha TEXT)");
  }

  //CRUD - CREATE, READ, UPDATE, DELETE

  //Ao inserir um usuário, essa insntância chama Future<Database> get db async
  Future<int> inserirUsuario(Usuario usuario) async{
    var bdCliente = await db;
    int res = await bdCliente.insert("$tabelaUsuario", usuario.toMap());
    return res; // Ao inserir na tabelaUsuario, retorna um número
  }
  //Extrair ou remover usuário
  Future<List> extrairUsuarios() async {
    var bdCliente = await db;
    var res = await bdCliente.rawQuery("SELECT * FROM $tabelaUsuario");

    return res.toList();
  }

  Future<int> coletaContagem() async {
    var bdCliente = await db;
    return Sqflite.firstIntValue(
      await bdCliente.rawQuery("SELECT COUNT(*) FROM $tabelaUsuario")
    );
  }
  //Extrair usuário a partir do id
  Future<Usuario> extrairUsuario(int id) async {
    var bdCliente = await db;
    var res = await bdCliente.rawQuery("SELECT * FROM $tabelaUsuario"
        " WHERE $colunaId = $id");
    if(res.length == 0) return null;
    return new Usuario.from(res.first);
  }

  Future<int> apagarUsuario(int id) async {
    var bdCliente = await db;

    return await bdCliente.delete(tabelaUsuario,
    where: "$colunaId = ?", whereArgs: [id]);
  }

  Future<int> atualizarUsuario(Usuario usuario) async {
    var bdCliente = await db;
    return await bdCliente.update(tabelaUsuario,
        usuario.toMap(), where: "$colunaId = ?", whereArgs: [usuario.id]);
  }

  //Fechar tabela ao final das operações
  Future fechar() async {
    var bdCliente = await db;
    return bdCliente.close();
  }

}