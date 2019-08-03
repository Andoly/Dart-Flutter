
class Usuario {
  int _id;
  String _nome;
  String _senha;


  Usuario(this._nome, this._senha);

  Usuario.map(dynamic obj){
    this._nome = obj['nome'];
    this._senha = obj['senha'];
    this._id = obj['id'];
  }
  int get id => _id;
  String get nome => _nome;
  String get senha => _senha;

  Map<String, dynamic> toMap() {
    var mapa = new Map<String, dynamic>();
    mapa["nome"] = _nome;
    mapa["senha"] = _senha;

    if (id != null){
      mapa["id"] = _id;
    }

    return mapa;

  }
  Usuario.from(Map<String, dynamic> mapa){
    this._id = mapa['id'];
    this._nome = mapa['nome'];
    this._senha = mapa['senha'];
  }
}
