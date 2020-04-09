class UserModel{
  
  String _usurio;
  String _email;
  String _contrasenia;
  int _raitng;

  UserModel({String usuario,String email,String pass,int ra = 1 }){
    this._usurio = usuario;
    this._email = email;
    this._contrasenia = pass;
    this._raitng = ra;
  }

  //get
  String get usuario => this._usurio;
  String get email => this._email;
  String get contrasenia => this._contrasenia;
  int get calficasion => this._raitng;

  //set

  //toostring
  @override
  String toString() {
    // TODO: implement toString
    return "####### Usuario: $_usurio,Email: $_email,calficasion:$_raitng ########";
  }


  


}