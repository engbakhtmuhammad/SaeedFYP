
import 'package:flutter/material.dart';
import 'package:saeed_fyp/Screens/Welcome/welcome_screen.dart';
import 'package:saeed_fyp/Screens/model/user.dart';
import 'package:saeed_fyp/Screens/services/helper.dart';
import 'package:saeed_fyp/Screens/update/components/body.dart';
import 'package:saeed_fyp/components/header.dart';
import 'package:saeed_fyp/components/profile_field.dart';
import 'package:saeed_fyp/constants.dart';
import 'package:saeed_fyp/main.dart';

class UsersProfile extends StatefulWidget {
  //User user;
  UsersProfile({Key key, 
  //this.user
  }) : super(key: key);
  @override
  createState() => _UsersProfileState(
    //user
    );
}

class _UsersProfileState extends State<UsersProfile> {
  //User user;
  _UsersProfileState(
    //this.user
    );
  bool _imageLoad = false;
  // void checkImage() {
  //   if (user.profilePictureURL == "")
  //     setState(() {
  //       _imageLoad = false;
  //     });
  //   setState(() {
  //     _imageLoad = true;
  //   });
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //checkImage();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xfff5f7fa),
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
            children: [
              Container(
                height: size.height * .18,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [kBackgroundColor,kPrimaryColor]),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35))),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        right: 30, left: 30, top: size.height * .065),
                    child: ListTile(
                      title: Center(
                          child: Text(
                        'user.username',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )),
                      subtitle: Center(
                        child: Text(
                            'user.bio.toString()'),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * .02),
                  ProfileField(
                    text: 'user.mail',
                    icon: Icons.pin_drop_outlined,
                    color: Colors.red,
                  ),
                  ProfileField(
                    text: 'user.mail.toString()',
                    icon: Icons.phone_outlined,
                    color: Colors.green,
                  ),
                  ProfileField(
                    text: 'user.language.toString()',
                    icon: Icons.language_outlined,
                    color: Colors.blue,
                  ),
                  ProfileField(
                    text: 'Edit Information',
                    icon: Icons.edit,
                    color: Colors.orange,
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Update(
                                  )));
                    },
                  ),
                  ProfileField(
                    text: 'log out from your account',
                    icon: Icons.logout,
                    color: Colors.red,
                    press: () async {
                      // user.active = false;
                      // user.lastOnlineTimestamp = Timestamp.now();
                      // FireStoreUtils.updateCurrentUser(user);
                      // await auth.FirebaseAuth.instance.signOut();
                      // MyAppState.currentUser = null;
                      pushAndRemoveUntil(context, WelcomeScreen(), false);
                    },
                  ),
                  // ProfileField(
                  //   text: '',
                  //   icon: Icons.logout,
                  //   color: kPrimaryLightColor,
                  // ),
                ],
              ),
            ],
          ),
          Positioned(
            top: size.height * .09,
            left: size.width / 2 - size.height * 0.08,
            child: CircleAvatar(
              radius: size.height * .08,
              backgroundColor: kPrimaryColor,
              //child: Text('S',style: TextStyle(color: kPrimaryLightColor,fontSize: 45),),
              backgroundImage: AssetImage('assets/images/bg.jpg'),
            ),
          ),
        ]),
      ),
    );
  }
}
