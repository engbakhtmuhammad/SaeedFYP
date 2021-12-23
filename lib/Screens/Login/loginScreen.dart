
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saeed_fyp/Screens/Admin/components/amin_screen.dart';
import 'package:saeed_fyp/Screens/Home/Home.dart';
import 'package:saeed_fyp/Screens/model/BO/BO.dart';
import 'package:saeed_fyp/Screens/model/DAO/DAO.dart';
import 'package:saeed_fyp/Screens/model/user.dart';
import 'package:saeed_fyp/components/already_have_an_account_acheck.dart';
import 'package:saeed_fyp/components/rounded_button.dart';
import 'package:saeed_fyp/components/text_field_container.dart';

import '../../constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  State createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  GlobalKey<FormState> _key = new GlobalKey();
  AutovalidateMode _validate = AutovalidateMode.disabled;
  String email = '', password = '';

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool hidePassword = true;
  List<User> users = [];
  var dao = DAO();

    passwordiconOnpressed() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
        if (users.isEmpty) {
      users = Provider.of<List<User>>(context);
    }
    return Scaffold(
      body: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(alignment: Alignment.center, children: <Widget>[
            Positioned(
              top: -150,
              left: 0,
              child: Image.asset(
                "assets/images/back1.png",
                width: size.width,
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              child: Form(
                key: _key,
                autovalidateMode: _validate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image(
                      width: size.width * .7,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/icons/login.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Container(
                        width: size.width * .4,
                        height: 02,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: ListTile(
                        title: Text(
                          'Welcome',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(
                          'Sign in to your account',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
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
                            TextFieldContainer(
                              child: TextFormField(
                                controller: usernameController,
                                textAlignVertical: TextAlignVertical.center,
                                textInputAction: TextInputAction.next,
                                //validator: validateName,
                                // onSaved: (String val) {
                                //   email = val;
                                // },
                                onFieldSubmitted: (_) =>
                                    FocusScope.of(context).nextFocus(),
                                //keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person,
                                    color: kPrimaryColor,
                                  ),
                                  hintText: "Your Username",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            TextFieldContainer(
                              child: TextFormField(
                                controller: passwordController,
                                textAlignVertical: TextAlignVertical.center,
                                //validator: validatePassword,
                                // onSaved: (String val) {
                                //   password = val;
                                // },
                                onFieldSubmitted: (password) async {
                                  await _sendToServer();
                                },
                                obscureText: hidePassword,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  icon: Icon(
                                    Icons.lock,
                                    color: kPrimaryColor,
                                  ),
                                  suffixIcon: IconButton(
                                    color: kPrimaryColor,
                            icon: Icon(hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            }),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            RoundedButton(
                              text: "LOGIN",
                              press: _sendToServer
                              
                            ),
                            SizedBox(height: size.height * 0.05),
                            AlreadyHaveAnAccountCheck(
                              press: () {
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ])),
    );
  }


  _sendToServer() {
        if (users.any((item) => item.username == usernameController.text)) {
      User user = users
          .firstWhere((item) => item.username == usernameController.text);
      if (user.passwordVerify(passwordController.text)) {
        // Login App, you're in!
        if(user.usertype=='admin'){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminScreen()));
        //MyAppState.currentUser=user;
        }
        else{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
        //MyAppState.currentUser=user;
        }
        // openDialog(context, 'User detected',
        //     "You're in! App gets started here with the current user");
      } else {
        // Incorrect password
        openDialog(context, 'Invalid data', 'Your password is not correct');
      }
    } else {
      // User does not exist
      openDialog(context, 'Invalid data', 'Make sure your username is correct');
    }
    print(usernameController.text);
    print(passwordController.text);
  }
}
