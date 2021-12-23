import 'package:flutter/material.dart';
import 'package:saeed_fyp/Screens/Home/Home.dart';
import 'package:saeed_fyp/Screens/Login/loginScreen.dart';
import 'package:saeed_fyp/Screens/Welcome/components/background.dart';
import 'package:saeed_fyp/Screens/model/user.dart';
import 'package:saeed_fyp/Screens/signUp/signUpScreen.dart';
import 'package:saeed_fyp/components/rounded_button.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   late  User user;
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.65),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
              child: Positioned(
                bottom: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: size.height * 0.03),
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
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return SignUpScreen(user: user,);
                        // }));
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
                          style: TextStyle(color: kPrimaryColor),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage())),
                          child: Text(
                            ' Skip',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
