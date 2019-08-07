import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../modelos/task.dart';

class DbAjudante {
  static final DbAjudante _instance = new DbAjudante.internal();

  factory DbAjudante() => _instance;

  final String nomeTabela = "taskTabela";
  final String colunaId = "id";
  final String taskNome = "nome";
  final String taskData = "data";

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initBd();
    return _db;
  }

  DbAjudante.internal();

  initBd() async {
    Directory documentoDiretorio = await getApplicationDocumentsDirectory();
    String caminho = join(documentoDiretorio.path,
        "task_db.db"); // home://directory/files/bd_principal.db

    var nossoBD = await openDatabase(caminho, version: 1, onCreate: _onCreate);
    return nossoBD;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE $nomeTabela(id INTEGER PRIMARY KEY,"
        "$taskNome TEXT,"
        "$taskData TEXT)");
  }

  //Insertion task
  Future<int> salvarTask(Task item) async {
    var bdCliente = await db;
    int res = await bdCliente.insert("$nomeTabela", item.toMap());
    return res;
  }

  // Get task
  Future<List> recuperarTask() async {
    var bdCliente = await db;
    var res = await bdCliente.rawQuery("SELECT * FROM $nomeTabela ORDER BY $taskNome ASC");
    return res.toList();
  }

  //Contagem
  Future<int> contagem() async {
    var bdCliente = await db;
    return Sqflite.firstIntValue(
        await bdCliente.rawQuery("SELECT COUNT(*) FROM $nomeTabela"));
  }

  Future<Task> recuperarAllTask(int id) async {
    var bdCliente = await db;
    var res = await bdCliente.rawQuery("SELECT * FROM $nomeTabela"
        " WHERE id = $colunaId ");
    if (res.length == 0) return null;
    return new Task.fromMap(res.first);
  }

  //Delete task
  Future<int> apagarTask(int id) async {
    var bdCliente = await db;
    return await bdCliente.delete(nomeTabela, where: "$colunaId = ?", whereArgs: [id]);
  }

  //Update task
  Future<int> atualizarTask(Task item) async {
    var bdCliente = await db;
    return await bdCliente.update("$nomeTabela", item.toMap(), where: "$colunaId = ?", whereArgs: [item.id]);
  }

  Future fechar() async {
    var bdCliente = await db;
    return bdCliente.close();
  }
}
