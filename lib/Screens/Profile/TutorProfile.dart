
import 'package:flutter/material.dart';
import 'package:saeed_fyp/Screens/Welcome/welcome_screen.dart';
import 'package:saeed_fyp/Screens/model/user.dart';
import 'package:saeed_fyp/Screens/services/helper.dart';
import 'package:saeed_fyp/Screens/update/components/body.dart';
import 'package:saeed_fyp/components/header.dart';
import 'package:saeed_fyp/components/profile_field.dart';
import 'package:saeed_fyp/constants.dart';
import 'package:saeed_fyp/main.dart';

class TutorProfile extends StatefulWidget {
  //User user;
  TutorProfile({
    Key key,
    //this.user
  }) : super(key: key);
  @override
  createState() => _TutorProfileState(
      //user
      );
}

class _TutorProfileState extends State<TutorProfile> {
  //User user;
  _TutorProfileState(
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
      body: Stack(children: [
        Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [kBackgroundColor, kPrimaryColor]),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: size.height * .03),
            child: ListTile(
              title: Text(
                "Saeed Khan Tareen",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "(5)",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  )
                ],
              ),
              leading: CircleAvatar(
                radius: size.height * .04,
                backgroundColor: kPrimaryColor,
                child: Text(
                  'S',
                  style: TextStyle(color: kPrimaryLightColor, fontSize: 45),
                ),
                // backgroundImage: _imageLoad
                //         ? AssetImage('assets/images/place_holder.png')
                //         : NetworkImage('user.profilePictureURL'),
              ),
            ),
          ),
        ),
        Positioned(
          top: size.height * .15,
          child: Container(
            height: size.height * .85,
            width: size.width,
            decoration: BoxDecoration(
                color: Color(0xfff5f7fa),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20,),
                ListTile(
                  
                  title: Text(
                  "About Tutor:",
                  style: TextStyle(
                      color: kBMediumColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  "To use github as central center of our code you really need to know how to use github as team member .",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
              ),
              ),
              Divider(),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(
                  "School:",
                  style: TextStyle(
                      color: kBMediumColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
              ),
               ),
               Card(
                 child: ListTile(title: Text(
                "University of Balochistan",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(
                  "Rate per hour:",
                  style: TextStyle(
                      color: kBMediumColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
              ),
               ),
               Card(
                 child: ListTile(title: Text(
                "\$2.0",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(
                  "Tutoring Location:",
                  style: TextStyle(
                      color: kBMediumColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
              ),
               ),
               Card(
                 child: ListTile(title: Text(
                "Lehrhi gate, near Asian villas quetta",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(
                  "Select course for tutoring session:",
                  style: TextStyle(
                      color: kBMediumColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
              ),
               ),
               Card(
                 child: ListTile(title: Text(
                "Web Engineering",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),),
               )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
