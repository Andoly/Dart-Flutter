 //Classes abstratas e interface
   abstract class Animal{
     // métodos abstrato
       void respirar();
       void acao();
   }
   class Humorista extends Pessoa implements Engracado{
    Humorista(String nome, String nacionalidade) : super(nome, nacionalidade);

      @override
      void causarRisos() {
        print("Humorista de qualidade");
      }
   }

    abstract class Engracado {
      void causarRisos(){
      }
    }

    class Pessoa implements Animal{
  String nome, nacionalidade;
  Pessoa(this.nome, this.nacionalidade);

      @override
       void respirar(){
         print("Respirando como ser humano");
       }
      @override
      void acao() {
        print("Fazendo barulho semelhante a de humano");
      }
      @override
      String toString() {
        print("${nome} de nacionalidade ${nacionalidade}");
        return super.toString();
      }
   }

    main(List<String> arguments) {
    var pessoa = new Pessoa("Andoly", "Brasileiro");
    pessoa.toString();

    var Humor = new Humorista("Cocielo", "Brasileiro");
    Humor.toString();
    Humor.acao();
    Humor.causarRisos();
    Humor.respirar();
    }

