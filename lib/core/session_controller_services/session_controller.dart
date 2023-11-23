class SessionController{
  static final SessionController _seassion = SessionController._internal();

  String ? userId;

  factory SessionController(){
    return _seassion;
  }
  SessionController._internal(){

  }
}