import 'package:E/E.dart' as E;

main(List<String> arguments) {
  // Criando estrutura de um mapa, ("Chave" : "Descrição")
  var atletas = {
    "primeiro" : "CR7",
    "segundo" : "Messi",
    "terceiro" : "Modric",
    "quarto" : "Griezmann",
    "quinto" : "Mbappe"
  };
  //print(atletas["primeiro"]); Exibindo a descrição da primeira chave
  print(atletas); //Exibindo o mapa completo
  print("\nAtletas :");//Para exibir apenas o nome das chaves(k) ou somente o valor(v)
  atletas.forEach((k,v) => print(v));

  //Exemplo de lista
  var lista = [2,0,1,4,0,5,0,1,7];
  //Criando um objeto chamado de "Letra" que só permite String
  var Letra = List<String>();
  Letra.add("Andoly");
  Letra.add("Diony");
  Letra.add("Douglas");
  Letra.add("Rafael");

  print("\nExibir Lista de nomes da lista Letra");
  for(int i=0; i < Letra.length; i++){
    print("Funcionário[$i]: ${Letra[i]}");
  }
  print("\nExibir indices e seus valores");
  for(var i=0; i <lista.length ;i++){
    print("O indice $i tem valor ${lista[i]}");
  }

}
