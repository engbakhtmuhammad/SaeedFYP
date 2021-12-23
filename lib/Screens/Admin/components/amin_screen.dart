import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:saeed_fyp/Screens/Admin/components/user_body.dart';
import 'package:saeed_fyp/Screens/Login/loginScreen.dart';
import 'package:saeed_fyp/components/rounded_search_field.dart';

import '../../../constants.dart';
import 'background.dart';

class AdminScreen extends StatefulWidget {
  AdminScreen({Key? key,}) : super(key: key);
  @override
  createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  _AdminScreenState();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //SizedBox(height: size.height * 0),
              Positioned(
                  top: 0,
                  child: AppBar(
                    elevation: 0.0,
                    actions: [
                      IconButton(
                          icon: Icon(Icons.logout),
                          //Logout function
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          color: Colors.white)
                    ],
                    centerTitle: true,
                    title: Text(
                      'All Docotors',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.transparent,
                  )),
              RoundedSearchField(
                hintText: 'Dr. Example',
                onChanged: (value) {}, onPressed: (){}, searchController: searchController,
              ),
              Container(
                width: size.width,
                height: size.height * .6945,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Positioned(
                  bottom: 0,
                  child: Stack(
                    children: <Widget>[
                     
                      // StreamBuilder(
                      //     stream: FirebaseFirestore.instance
                      //         .collection('users').where('userType', isEqualTo: 'doctor')
                      //         .snapshots(),
                      //     builder: (BuildContext context,
                      //         AsyncSnapshot<QuerySnapshot> snapshot) {
                      //       if (!snapshot.hasData) {
                      //         return Center(
                      //           child: CircularProgressIndicator(),
                      //         );
                      //       }

                      //       // return ListView(
                      //       //   children: snapshot.data.docs.map((document) {
                      //       //       if(document['userType']=='doctor'){
                      //       //         return DoctorListField(
                      //       //       name: document["firstName"],
                      //       //       bio: document["bio"],
                      //       //     );
                      //       //       }
                      //       //   }).toList()
                      //       // );
                      //     }),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: kPrimaryColor,
        //onPress admin can add/create account for doctor
        onPressed: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) {
          //       return DoctorSignUpScreen();
          //     }));
        },
      ),
      bottomNavigationBar: Container(
          height: size.height * .1,
          width: size.width,
          decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                        icon: Image.asset('assets/icons/doctor.png',
                            color: kPrimaryColor),
                        onPressed: () {}),
                    IconButton(
                        icon: Image.asset(
                          'assets/icons/user.png',
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ShowUserPage();
                          }));
                        }),
              ],
            ),
          )),
    );
  }
}
