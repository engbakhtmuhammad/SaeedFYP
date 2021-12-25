import 'package:flutter/material.dart';
import 'package:saeed_fyp/Screens/model/BO/BO.dart';
import 'package:saeed_fyp/Screens/model/mysql.dart';
import 'package:saeed_fyp/Screens/model/user.dart';
import 'package:saeed_fyp/Screens/model/DAO/DAO.dart';
class NewUser extends StatefulWidget {
  User user;
  NewUser({this.user});
  @override
  _NewUserState createState() => _NewUserState();
}
var dao = new DAO();
List<User> users = [];
class _NewUserState extends State<NewUser> {
  Mysql db = new Mysql();
  TextEditingController _controller1;
  TextEditingController _controller2;
  TextEditingController _controller3;
  TextEditingController _controller4;
  TextEditingController _controller5;
  TextEditingController _controller6;
  TextEditingController _controller7;
  TextEditingController _controller8;
  bool validate1 = true;
  bool validate2 = true;
  bool validate3 = true;
  bool validate4 = true;
  bool validate5 = true;
  bool validate6 = true;
   bool validate7 = true;
  bool validate8 = true;

  isDefault(User user) {
    if (user.firstname == '' && user.lastname == '') {
      return true;
    } else {
      return false;
    }
  }

  Widget button(String buttonText) {
    {
      return Container(
          height: 50,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: RaisedButton(
            textColor: Colors.white,
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 18),
            ),
            onPressed: () {
              String username = _controller1.text;
              String firstname = _controller2.text;
              String lastname = _controller3.text;
              String mail = _controller4.text;
              String bio = _controller5.text;
              //
              String usertype = _controller6.text;
              String language = _controller7.text;
              String password = _controller8.text;
              getUser();
              // setState(() {
              //   isNullOrEmpty(username) ? validate1 = false : validate1 = true;
              //   isNullOrEmpty(firstname) ? validate2 = false : validate2 = true;
              //   isNullOrEmpty(lastname) ? validate3 = false : validate3 = true;
              //   isNullOrEmpty(mail) ? validate4 = false : validate4 = true;
              //
              //   isNullOrEmpty(bio) ? validate5 = false : validate5 = true;
              //   isNullOrEmpty(usertype) ? validate6 = false : validate6 = true;
              //   isNullOrEmpty(language) ? validate7 = false : validate7 = true;
              //   isNullOrEmpty(password) ? validate8 = false : validate8 = true;
              // });
              // if (validate1 == true &&
              //     validate2 == true &&
              //     validate3 == true &&
              //     validate4 == true &&
              //     validate5 == true) {
              //   // signUponPressed();
                widget.user =
                    new User(username, firstname, lastname, mail,bio,usertype,language, password);
                Navigator.of(context).pop(widget.user);
              // }

            },
          ));
    }
  }

  Widget _inputData(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          textfield('User name', _controller1, false, validate: validate1),
          SizedBox(height: 10),
          textfield('First Name', _controller2, false, validate: validate2),
          SizedBox(height: 10),
          textfield('Last name', _controller3, false, validate: validate3),
          SizedBox(height: 10),
          textfield('Mail', _controller4, false, validate: validate3),
          SizedBox(height: 10),
          textfield('bio', _controller5, false, validate: validate5),
          SizedBox(height: 10),
          textfield('usertype', _controller6, false, validate: validate6),
          SizedBox(height: 10),
          textfield('languese speak', _controller7, false, validate: validate7),
          SizedBox(height: 10),
          textfield('Password', _controller8, true, validate: validate8),
          SizedBox(height: 50),
          isDefault(widget.user) ? button('Insert') : button('Update'),
        ],
      ),
    );
  }

  @override
  void initState() {
    if (widget.user == null) widget.user = new User.def();
    _controller1 = TextEditingController();
    _controller1.text = widget.user.username;
    _controller2 = TextEditingController();
    _controller2.text = widget.user.firstname;
    _controller3 = TextEditingController();
    _controller3.text = widget.user.lastname;
    _controller4 = TextEditingController();
    _controller4.text = widget.user.mail;
    _controller5 = TextEditingController();
    _controller5.text = widget.user.bio;
    _controller6 = TextEditingController();
    _controller6.text = widget.user.usertype;
    _controller7 = TextEditingController();
    _controller7.text = widget.user.language;
    _controller8 = TextEditingController();
    _controller8.text = widget.user.hash;
    super.initState();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
    _controller7.dispose();
    _controller8.dispose();
    super.dispose();
  }
  signUponPressed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => NewUser()))
        .then((newuser) {
      if (newuser != null) {
        dao.insertUser(newuser as User).then((_) {
          dao.db.getConnection().then((conn) {
            String sql = 'select id from symptomchecker.users where username = ?;';
            conn.query(sql, [newuser.username]).then((results) {
              for (var row in results) {
                int id = row[0];
                newuser.id = id;
                setState(() {
                  users.add(newuser);
                });
              }
              conn.close();
            });
          });
        });
      }
    });
  }

  Future<List<User>> getUser() async {
    List<User> result = [];

    db.getConnection().then((conn) {
      String sql = 'select * from symptomchecker.users';
      print("starts here");
      conn.query(sql).then((results) {
        for (var row in results) {
          // print(row.fields.values.elementAt(0));
          row.fields.forEach((key, value) {
            if(key=='id') {
              print(value);
            }
          });
          result.add(
              new User.db(row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7],row[8]));

        }
      }, onError: (error){
        print('$error');
      }).whenComplete(() {
        conn.close();
      });
    });
    // print(result);
    return result;
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: isDefault(widget.user)
              ? new Text('New User')
              : new Text('Update User'),
        ),
        body: SingleChildScrollView(child: Center(child: _inputData(context))));
  }
}
