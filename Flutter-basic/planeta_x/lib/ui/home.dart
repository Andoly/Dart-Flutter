import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int radioValor = 1;
  String _nomePlaneta;

  void tomaContaValorRadio(int value){
    setState(() {
      radioValor = value;
      switch(radioValor){
        case 0:
          _nomePlaneta = "Planeta Plutao";
          debugPrint(_nomePlaneta);
          break;
        case 1:
          _nomePlaneta = "Planeta Marte";
          debugPrint(_nomePlaneta);
          break;
        case 2:
          _nomePlaneta = "Planeta Venus";
          debugPrint(_nomePlaneta);
          break;

        default:
          debugPrint("Nenhuma opção selecionada");
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Planeta X"),
        backgroundColor: Colors.black38,
      ),
    backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(1.5),
              children: <Widget>[
                Image.asset(
                    'assets/planet.png',
                    height: 100.0,
                  width: 170.0,
                ),
                Container(
                margin: const EdgeInsets.all(3.0),
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'O seu peso na Terra',
                          hintText: 'Kg',
                          icon: Icon(Icons.person_outline)
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Radio<int>(
                              activeColor: Colors.brown,
                              value: 0,
                              groupValue: radioValor,
                              onChanged: tomaContaValorRadio),
                          Text("Plutao",
                          style: TextStyle(
                            color: Colors.white30
                          )
                          ),
                          Radio<int>(
                            activeColor: Colors.red,
                            value: 1,
                            groupValue: radioValor,
                            onChanged: tomaContaValorRadio,
                          ),
                          Text("Marte",
                          style: TextStyle(color: Colors.white30),
                          ),
                          Radio<int>(
                            activeColor: Colors.orangeAccent,
                            value: 2,
                            groupValue: radioValor,
                            onChanged: tomaContaValorRadio,
                          ),
                          Text("Venus",
                          style: TextStyle(color: Colors.white30),
                          )
                        ],
                      ),
                      Text("O meu peso ...",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.4,
                        fontWeight: FontWeight.w400,
                      ),
                      )
                    ],
                  ),
                )
              ],
        ),
      ),
    );
  }
  double pesoPlaneta(String peso, double gravidadeSuperficial){
    if(int.parse(peso).toString().isNotEmpty &&
    int.parse(peso) > 0){
      return (int.parse(peso)* gravidadeSuperficial);
    }
    else{
      print("Numero errado...");
      return int.parse("180") * 0.38;

    }
  }
}
