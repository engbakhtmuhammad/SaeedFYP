import 'package:flutter/material.dart';
import 'package:saeed_fyp/Screens/Home/Home.dart';
import 'package:saeed_fyp/Screens/Home/Navigation.dart';
import 'package:saeed_fyp/Screens/model/user.dart';
import 'package:saeed_fyp/Screens/signUp/newUser.dart';
import 'package:saeed_fyp/components/rounded_button.dart';
import 'package:saeed_fyp/Screens/Login/loginScreen.dart';
import 'package:saeed_fyp/Screens/signUp/signUpScreen.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {


  signUponPressed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SignUpScreen()))
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          child: Center(
            child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: ListTile(
                        trailing: Icon(Icons.school_outlined,size: 120,color: Colors.white,),
                        title: Text(
                          'The Tutors',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold,fontSize: 36),
                        ),
                        subtitle: Text(
                          
                          'Wellcome to App, \nSign in or Register your account\n',
                          textAlign: TextAlign.justify,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600,fontSize: 20,),
                        ),
                      ),
                    ),
          ),
      height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [kBackgroundColor,kPrimaryColor])
            )),
            
        SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: size.height * 0.6),
            Container(
              height: size.height*.4,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
              
                children: <Widget>[
                  SizedBox(height: size.height * 0.05),
                  RoundedButton(
                    text: "LOGIN",
                    press: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }));
                    },
                  ),
                  RoundedButton(
                    color: kPrimaryColor,
                    text: "SIGNUP",
                    press: () {
                      signUponPressed();
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Do it later',
                        style: TextStyle(color: kBackgroundColor),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NavigationPage())),
                        child: Text(
                          ' Skip',
                          style: TextStyle(
                            color: kBackgroundColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      ]);
  }
}
