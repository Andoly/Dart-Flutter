import 'package:Learning_dart/Learning_dart.dart' as Learning_dart;
import 'package:meta/meta.dart';

class Microfone{    //Objeto com seus atributos e métodos
  String cor = "Azul";
  String nome = "Bolinha";
  String marca = "Samsung";
  String modelo = "S125";

  //Métodos do objeto Microfone
  void abaixarVolume() {
    print(" Vai abaixando o volume");
  }
  void aumentarVolume(){
    print(" Vai aumentando o volume");
  }
  // Construtor parametrizado do objeto Microfone
  Microfone(String cor, String nome, String marca, String modelo){
    this.cor = cor;
    this.nome = nome;
    this.marca = marca;
    this.modelo = modelo;
  }
}
class TV{
  String nome;
  String modelo;
  // Construtor nomeado   
  TV.iniciar(nome, modelo){
    this.nome = nome;
    this.modelo = modelo;
  }
}
main(List<String> arguments) {
//var blueYeti = new Microfone(); // Instância do microfone
  Microfone blueYeti = new Microfone("Azul", "Microfone Gordinho", "Samsung", "S135"); // Essa instância do objetivo
  var TV1 = new TV.iniciar("SAMSUNG SMARTV", "S7750");

    print("O nome do microfone é "+ (blueYeti.nome));
    blueYeti.abaixarVolume();
    blueYeti.aumentarVolume();
    print(TV1.nome);
}
