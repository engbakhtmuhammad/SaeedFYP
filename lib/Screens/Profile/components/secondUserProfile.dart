
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saeed_fyp/Screens/Profile/components/background.dart';
import 'package:saeed_fyp/Screens/update/components/body.dart';
import 'package:saeed_fyp/components/profile_field.dart';
import 'package:saeed_fyp/Screens/Login/loginScreen.dart';

class SecondUserProfile extends StatefulWidget {
  final String userMap;
  SecondUserProfile({Key key, this.userMap }) : super(key: key);
  @override
  createState() => _SecondUserProfileState();
}

class _SecondUserProfileState extends State<SecondUserProfile>
    with WidgetsBindingObserver {
  _SecondUserProfileState();

  String userMap;
  bool isLoading = false;
  final TextEditingController _search = TextEditingController();
  var userInfo;
//   getUserInfo() async {
// userInfo = await _firestore.collection('users').doc(userMap).get().then((value) => {
 
// });
//   }

  @override
  initState()  {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    //getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Background(
      child: Stack( 
        children: [
          Positioned(
              top: 0,
              child: AppBar(
                centerTitle: true,
                //Name of the disease from database
                title: Text(
                  userInfo['firstName'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.transparent,
              )),
          Positioned(
            top: size.height * .25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * .65,
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                right: 30, left: 30, top: size.height * .08),
                            child: ListTile(
                              title: Center(
                                  child: Text(
                                userInfo['firstName'],
                                style: TextStyle(fontWeight: FontWeight.w600),
                              )),
                              subtitle: Text(
                                 userInfo['bio'],),
                            ),
                          ),
                          SizedBox(height: size.height * .02),
                          ProfileField(
                            text: 'Address of the user',
                            icon: Icons.pin_drop_outlined,
                            color: Colors.red,
                          ),
                          ProfileField(
                            text: "contact",
                            icon: Icons.phone_outlined,
                            color: Colors.green,
                          ),
                          ProfileField(
                            text: 'Languages user speaks',
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
                                      builder: (context) => Update()));
                            },
                          ),
                          ProfileField(
                            text: 'log out from your account',
                            icon: Icons.logout,
                            color: Colors.red,
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                    width: size.width,
                    height: size.height * .1,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Update();
                          }));
                        },
                        child: Text(
                          'Edit Information',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Positioned(
            top: size.height * .18,
            left: size.width / 2 - size.height * 0.08,
            child: CircleAvatar(
              radius: size.height * .08,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/images/doctorProfiles.png'),
            ),
          ),
        ],
      ),
    );
  }
}
