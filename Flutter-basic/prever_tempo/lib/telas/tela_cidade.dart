
//Nova tela
import 'package:flutter/material.dart';

class MudarCidade extends StatelessWidget{
  var _cidadeCampoControl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Escolher cidade'),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Center(
            child: Image.asset('assets/white-snow.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          ListView(
            children: <Widget>[
              ListTile(
                title: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cidade',
                  ),
                  controller: _cidadeCampoControl,
                  keyboardType: TextInputType.text,
                ),
              ),
              ListTile(
                title: FlatButton(
                  onPressed: (){
                    Navigator.pop(context, {
                      'cidade': _cidadeCampoControl.text
                    });
                  },
                  textColor: Colors.white70,
                  color: Colors.grey,
                  child: Text('Previsão do tempo'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}
