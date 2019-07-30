import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prever_tempo/telas/tela_cidade.dart';
import 'package:prever_tempo/transacao/Coleta_clima.dart';
import 'package:prever_tempo/util/util.dart' as util;

class Previsao_tempo extends StatefulWidget {
  @override
  _Previsao_tempoState createState() => _Previsao_tempoState();
}

class _Previsao_tempoState extends State<Previsao_tempo> {
  String _cidadeInserida;

  Future _abrirNovaTela(BuildContext context) async {
    Map resultado = await Navigator
        .of(context)
        .push(new MaterialPageRoute<Map>(builder: (BuildContext context){
            return new MudarCidade();
         }));
    if(resultado != null && resultado.containsKey('cidade')){
      _cidadeInserida = resultado['cidade'];
      debugPrint("Cidade $_cidadeInserida");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Previsão do tempo'),
        backgroundColor: Colors.grey,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.menu), onPressed: () => _abrirNovaTela(context))
        ],
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset('assets/umbrella.png',
            width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,),
          ),
          Container(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("${_cidadeInserida == null ? util.minhaCidade : _cidadeInserida}",
                style: TextStyle(color: Colors.white,),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset('assets/light-rain.png'),
          ),
          atualizarTemWidget(_cidadeInserida)
        ],
      )
    );
  }

  Widget atualizarTemWidget(String cidade){
    return FutureBuilder(
        future:
          Coleta_clima(util.appId, cidade == null ? util.minhaCidade: cidade),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
            if(snapshot.hasData){
              Map conteudo = snapshot.data;
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      title: Text(conteudo['main']['temp'].toString() + "ºC"),
                      subtitle: ListTile(
                        title: Text('Humidade'),
                      ),
                    )
                  ],
                ),
              );
            }
              else{
                return Container(
                  child: Text('Falha'),
                );
             }
        }
    );
  }
}
