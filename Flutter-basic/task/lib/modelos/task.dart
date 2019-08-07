import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  String _taskNome;
  String _taskData;
  int _id;

  Task(this._taskNome, this._taskData);

  Task.map(dynamic obj) {
    this._taskNome = obj["nome"];
    this._taskData = obj["data"];
    this._id = obj["id"];
  }

  String get taskNome => _taskNome;
  String get taskData => _taskData;
  int get id => _id;

  Map<String, dynamic> toMap() {
    var mapa = new Map<String, dynamic>();
        mapa["nome"] = _taskNome;
        mapa["data"] = _taskData;

        if (_id != null) {
          mapa["id"] = _id;
        }
        return mapa;
  }

  Task.fromMap(Map<String, dynamic> mapa) {
    this._taskNome = mapa["nome"];
    this._taskData = mapa["data"];
    this._id = mapa["id"];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(_taskNome,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16.9
          ),),
          Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text("Criado em $taskData",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12.5,
                fontStyle: FontStyle.italic
              ),),
          )
        ],
      ),
    );
  }
}
