
import 'package:flutter/material.dart';

class Bank_Statement extends StatefulWidget {
  @override
  _Bank_StatementState createState() => _Bank_StatementState();
}

class _Bank_StatementState extends State<Bank_Statement> {
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
                fontSize: 15.6,
                color: Colors.grey,
                fontWeight: FontWeight.w700,
              )
            )
          ),

            Expanded(child: Center(
              child: Text("\$ 1000",
                style: TextStyle(
                  fontSize: 25.6,
                  color: Colors.black,
                  fontWeight: FontWeight.w700
                ),
              )
            ),),

            Expanded(child: Center(
              child: FlatButton(onPressed: ()=> debugPrint("Controle financeiro"),
              color: Colors.lightGreen,
                textColor: Colors.white70,
                child: Text("Extrato detalhado ",
                style: TextStyle(
                  fontSize: 19.9,
                ))
              )
             ))

          ],
        ),
      ),
    );
  }
}
