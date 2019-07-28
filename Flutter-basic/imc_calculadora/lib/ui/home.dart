import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _idadeControl = new TextEditingController();
  final TextEditingController _alturaControl = new TextEditingController();
  final TextEditingController _pesoControl = new TextEditingController();
  double resultado = 0.0;
  String resultadoFinal  = "";
  String _resultadoConsulta = "";

  void _calcularIMC(){
    setState(() {
      int idade = int.parse(_idadeControl.text);
      double altura = double.parse(_alturaControl.text);
      double peso = double.parse(_pesoControl.text);

      if((_idadeControl.text.isNotEmpty || idade > 0)
        && (_alturaControl.text.isNotEmpty)
        && (_pesoControl.text.isNotEmpty || peso > 0))
      {
        resultado = peso / (altura * altura);

        //Leitura do diagnostico
        if (double.parse(resultado.toStringAsFixed(1)) <= 16.9) {
          _resultadoConsulta = "Classificação: Muito abaixo do peso";

        }else if ( double.parse(resultado.toStringAsFixed(1)) > 16.9
            && resultado <= 18.4) {
          _resultadoConsulta = "Classificação: Abaixo do peso";
        }else if ( double.parse(resultado.toStringAsFixed(1)) > 18.4
            && resultado <= 24.9){
          _resultadoConsulta = "Classificação: Peso normal";

        }else if (double.parse(resultado.toStringAsFixed(1)) > 24.9
            && resultado <= 29.9) {
          _resultadoConsulta = "Classificação: Acima do peso";

        }else if(double.parse(resultado.toStringAsFixed(1)) > 29.9
            && resultado <= 34.9) {
          _resultadoConsulta = "Classificação: Obsidade Grau I";
        }else if(double.parse(resultado.toStringAsFixed(1)) > 34.9
            && resultado <= 40.0) {
          _resultadoConsulta = "Classificação: Obesidade grau II";
        }else if(double.parse(resultado.toStringAsFixed(1)) > 40.0) {
          _resultadoConsulta = "Classificação: Obesidade grau II";
        }else {
          resultado = 0.0;
        }
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Índice de massa corporal"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
              padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            Image.asset(
              'assets/imc-logo.png',
              height: 75.0,
              width: 70.0,
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topCenter,
//              height: 245.0,
//              width: 290.0,
              color: Colors.grey.shade300,
              child: Column(
                children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _idadeControl,
                      decoration: InputDecoration(
                          labelText: 'Idade',
                          hintText: 'Digite sua idade',
                          icon: Icon(Icons.person_outline)
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _alturaControl,
                      decoration: InputDecoration(
                          labelText: 'Altura(m)',
                          hintText: 'Digite sua altura',
                          icon: Icon(Icons.insert_chart)
                     ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _pesoControl,
                        decoration: InputDecoration(
                            labelText: 'Peso(Kg)',
                            hintText: 'Digite seu peso',
                            icon: Icon(Icons.line_weight)
                        ),
                      ),
                    ),
                  //Botão
                    Container(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: _calcularIMC,
                          color: Colors.pinkAccent,
                          child: Text('Calcular'),
                          textColor: Colors.white
                        ),
                      ),
                   )
                ],
              ),
            ),
          ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("IMC : ${resultado.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    fontSize: 19.9
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("$_resultadoConsulta",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w500
                      )
                  ),
                )

              ],
            )

          ],
        ),
      ),
    );
  }
}
