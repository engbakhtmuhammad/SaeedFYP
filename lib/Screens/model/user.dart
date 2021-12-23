import 'package:password/password.dart';

class User {
  late int id;
  late String username, firstname, lastname, mail, bio, usertype, language, hash;
  late PBKDF2 algorithm;

  User(
      this.username, this.firstname, this.lastname, this.mail,this.bio,this.usertype,this.language, String password) {
    algorithm = PBKDF2();
    hash = Password.hash(password, algorithm);
  }

  User.db(
      this.id, this.username, this.firstname, this.lastname, this.mail,this.bio,this.usertype,this.language, this.hash) {
    algorithm = PBKDF2();
  }

  User.def() {
    
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
