class UserModel{
  
  int _id;
  String _usurio;
  String _email;
  String _contrasenia;
  int _raitng;

  UserModel({int id,String usuario,String email,String pass,int ra = 1 }){
    this._id = id;
    this._usurio = usuario;
    this._email = email;
    this._contrasenia = pass;
    this._raitng = ra;
  }

  //get
  int get id => this._id;
  String get usuario => this._usurio;
  String get email => this._email;
  String get contrasenia => this._contrasenia;
  int get calficasion => this._raitng;

  //set
  void setRatin(int rating){
    this._raitng = rating;

  }
  //toostring
  @override
  String toString() => "####### Usuario: $_usurio,Email: $_email,calficasion:$_raitng ########";

  UserModel.fromMap(Map<String, dynamic> data){
    this._id = data['id'];
    this._email = data['email'];
    this._usurio = data['user'];
    this._contrasenia = data['pass'];
    this._raitng = data['rating'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this._id,
      'email': this._email,
      'user': this._usurio,
      'pass': this._contrasenia,
      'rating': this._raitng,
    };
  }
}