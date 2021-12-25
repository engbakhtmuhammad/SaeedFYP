
import 'package:saeed_fyp/Screens/model/mysql.dart';
import 'package:saeed_fyp/Screens/model/user.dart';

/// DAO == Data Access Object
/// Here we got the connection between the app and the database

class DAO {
  Mysql db = new Mysql();

  DAO();

  Future<List<User>> getUsers() async {
    List<User> result = [];
    db.getConnection().then((conn) {
      String sql = 'select * from symptomchecker.users;';
      conn.query(sql).then((results) {
        for (var row in results) {
          print(row.fields);
          result.add(
              new User.db(row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7],row[8]));
        }
      }, onError: (error){
        print('$error');
      }).whenComplete(() {
        conn.close();
      });
    });
    print(result);
    return result;
  }


  Future<List<User>> getquery(String sql,var condition) async {
    List<User> result = [];

    db.getConnection().then((conn) {
      conn.query(sql).then((results) {
        for (var row in results) {
          print(row.fields);
          result.add(
              new User.db(row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7],row[8]));

        }
      }, onError: (error){
        print('$error');
      }).whenComplete(() {
        conn.close();
      });
    });
    return result;
  }

  Future<void> insertUser(User user) async {
    db.getConnection().then((conn) {
      String sql =
          'insert into symptomchecker.users (username, firstname, lastname, mail, bio, usertype, language, password) values(?, ?, ?, ?, ?, ?, ?, ?)';
      conn.query(sql, [
        user.username,
        user.firstname,
        user.lastname,
        user.mail,
        user.bio,
        user.usertype,
        user.language,
        user.hash
      ]).then((results) {
        print('Inserted User succesfullly');
      }, onError: (error) {
        print('$error');
      }).whenComplete(() {
        conn.close();
      });
    });
  }
}
