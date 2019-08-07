import 'package:flutter/material.dart';
import 'package:task/main.dart';
import '../util/db_ajudante.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final TextEditingController _control = new TextEditingController();
  var db = new DbAjudante();
  final List<Task> _taskLista = <Task>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selecionarTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: <Widget>[
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemBuilder: (_, int posicao){
                  return Card(
                      color: Colors.white10,
                      child: ListTile(
                          title: _taskLista[posicao],
                          onLongPress: () => debugPrint("Long Press"),
                      ),
                  );
                },
              ),
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
        child: ListTile(
          title: Icon(Icons.add),
        ),
        onPressed: _showForm(),
      ),
    );
  }

  void _selecionarTask() async{
    List tarefa = await db.recuperarAllTask();
    tarefa.forEach((item){
      setState(() {
        _taskLista.add(Task.map(item));
      });
    });
  }
  _showForm() {
    var alert = AlertDialog(
      content: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _control,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Estudar flutter',
                icon: Icon(Icons.note_add)
              ),
            ),
          )
        ],
      ),
      actions: <Widget>[
          FlatButton(onPressed: (){
            debugPrint("");
          },
          child: Text('Salvar'),)
      ],
    );
    showDialog(context: context,
    builder: (_){
        return alert;
    });
  }

}



