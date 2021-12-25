import 'package:password/password.dart';

class User {
  int id;
  String username, firstname, lastname, mail, bio, usertype, language, hash;
  PBKDF2 algorithm;

  User(
      this.username, this.firstname, this.lastname, this.mail,this.bio,this.usertype,this.language, String password) {
    algorithm = new PBKDF2();
    hash = Password.hash(password, algorithm);
  }

  User.db(
      this.id, this.username, this.firstname, this.lastname, this.mail,this.bio,this.usertype,this.language, this.hash) {
    algorithm = new PBKDF2();
  }

  User.def() {
    id = null;
    username = '';
    firstname = '';
    lastname = '';
    mail = '';
    bio = '';
    usertype='';
    language='';
    hash = '';
    algorithm = new PBKDF2();
  }

  bool passwordVerify(String password) {
    return Password.verify(password, hash);
  }
}
