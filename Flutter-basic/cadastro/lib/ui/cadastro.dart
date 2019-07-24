
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro "),
        backgroundColor: Colors.indigoAccent,
      ),
      backgroundColor: Colors.indigoAccent,
      body: Container(
        alignment: Alignment.topRight,
        child: ListView(
          children: <Widget>[
            Image.asset("assets/Gran.png",
            width : 45.0,
            height : 45.0,
            ),

            Container(
          width: double.infinity,
          color: Colors.white70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Nome',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.5)
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
               decoration: InputDecoration(
                 hintText: 'Senha',
                 border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(4.5)
                 ),
               ),
                obscureText: true,
              ),
            ),
            Center(
                child: Row(
                  //Elimina a necessidade das linhas 65 e 78
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: <Widget>[
                    //Acessar
                    Container(
                      //margin: const EdgeInsets.only(left: 38.0),
                      child: RaisedButton(onPressed: ()=> null,
                      color: Colors.white,
                        child: Text("Acessar",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    //Recuperar senha
                    Container(
                      //margin: const EdgeInsets.only(left: 52.0),
                      child: RaisedButton(onPressed: () => null,
                      color: Colors.white,
                        child: Text("Recuperar senha",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.blueAccent
                        ),
                        ),
                      ),
                    )

                  ],
                ),
            ),
                    Container(
                      margin: const EdgeInsets.only(right: 132.0),
                      child: RaisedButton(onPressed: () => null,
                      color: Colors.white,
                         child: Text("Primeiro acesso",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.blueAccent
                          ),
                        ),
                       ),
                    )
          ],
        ),
      ),

          ],
        ),
      ),
    );
  }
}
