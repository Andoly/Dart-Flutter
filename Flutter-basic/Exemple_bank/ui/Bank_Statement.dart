import 'package:flutter/material.dart';

  class Bank_Statement extends StatefulWidget {
    @override
    _Bank_StatementState createState() => _Bank_StatementState();
  }

  class _Bank_StatementState extends State<Bank_Statement> {
    int _contadorGrana = 500;

    // @ uso de underscore faz com que a função só possa ser chamada apenas nesse bloco.
    void _emprestimo() {
      //Responsável por atualizar os valores de exibição
      setState((){
        _contadorGrana = _contadorGrana + 100;
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Extrato"),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              Center(
                  child: Text("Saldo atual ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                      )
                  )
              ),

              Expanded(child: Center(
                  child: Text("\$ $_contadorGrana",
                    style: TextStyle(
                        fontSize: 25.6,
                        color: Colors.black,
                        fontWeight: FontWeight.w700
                    ),)
              )),

              Expanded(child: Center(
                  child: FlatButton(onPressed: _emprestimo ,
                      color: Colors.lightGreen,
                      textColor: Colors.white70,
                      child: Text("Emprestimo de \$ 100 ",
                          style: TextStyle(
                            fontSize: 19.9,)
                      ),)
              ))

            ],
          ),
        ),
      );
    }
  }
  
