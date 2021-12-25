import 'package:flutter/material.dart';
import 'package:saeed_fyp/Screens/Admin/components/amin_screen.dart';
import 'package:saeed_fyp/Screens/Home/Home.dart';
import 'package:saeed_fyp/Screens/Home/Navigation.dart';
import 'package:saeed_fyp/Screens/model/BO/BO.dart';
import 'package:saeed_fyp/Screens/model/DAO/DAO.dart';
import 'package:saeed_fyp/Screens/model/user.dart';
import 'package:saeed_fyp/Screens/services/helper.dart';
import 'package:saeed_fyp/components/already_have_an_account_acheck.dart';
import 'package:saeed_fyp/components/rounded_button.dart';
import 'package:saeed_fyp/components/text_field_container.dart';
import 'package:saeed_fyp/constants.dart';
import 'package:saeed_fyp/main.dart';
import 'package:provider/provider.dart';

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
  var dao = new DAO();

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
      body: SingleChildScrollView(
        child: Container(
            height: size.height,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [kBackgroundColor, kPrimaryColor])),
            child: Stack(children: <Widget>[
              Form(
                key: _key,
                autovalidateMode: _validate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: size.height*.4,),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: ListTile(
                        title: Text(
                          'Welcome',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold,fontSize: 26),
                        ),
                        subtitle: Text(
                          'Sign in to your account',
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(35))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: size.height * 0.045),
                            TextFieldContainer(
                              child: TextFormField(
                                controller: usernameController,
                                textAlignVertical: TextAlignVertical.center,
                                textInputAction: TextInputAction.next,
                                validator: validateName,
                                // onSaved: (String val) {
                                //   email = val;
                                // },
                                onFieldSubmitted: (_) =>
                                    FocusScope.of(context).nextFocus(),
                                //keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person,
                                    color: kBMediumColor,
                                  ),
                                  hintText: "Your Username",
                                  hintStyle: TextStyle(color: kBMediumColor),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            TextFieldContainer(
                              child: TextFormField(
                                controller: passwordController,
                                textAlignVertical: TextAlignVertical.center,
                                validator: validatePassword,
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
                                  hintStyle: TextStyle(color: kBMediumColor),
                                  icon: Icon(
                                    Icons.lock,
                                    color: kBMediumColor,
                                  ),
                                  suffixIcon: IconButton(
                                      color: kBMediumColor,
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
                            RoundedButton(text: "LOGIN", press: _sendToServer),
                            SizedBox(height: size.height * 0.05),
                            AlreadyHaveAnAccountCheck(
                              press: () {},
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ])),
      ),
    );
  }

  _sendToServer() {
    if (users.any((item) => item.username == usernameController.text)) {
      User user =
          users.firstWhere((item) => item.username == usernameController.text);
      if (user.passwordVerify(passwordController.text)) {
        // Login App, you're in!
        if (user.usertype == 'admin') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AdminScreen()));
          MyAppState.currentUser = user;
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NavigationPage()));
          MyAppState.currentUser = user;
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
