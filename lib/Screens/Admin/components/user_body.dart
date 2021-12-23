import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saeed_fyp/Screens/Login/loginScreen.dart';
import 'package:saeed_fyp/components/rounded_search_field.dart';

import '../../../constants.dart';
import 'background.dart';

class ShowUserPage extends StatefulWidget {
  ShowUserPage({Key ? key, }) : super(key: key);
  @override
  createState() => _ShowUserPageState();
}

class _ShowUserPageState extends State<ShowUserPage> {
  _ShowUserPageState();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var searchController;
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
                      'All Users',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.transparent,
                  )),
              RoundedSearchField(
                hintText: 'Search here',
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
                      //         .collection('users').where('userType', isEqualTo: 'user')
                      //         .snapshots(),
                      //     builder: (BuildContext context,
                      //         AsyncSnapshot<QuerySnapshot> snapshot) {
                      //       if (!snapshot.hasData) {
                      //         return Center(
                      //           child: CircularProgressIndicator(),
                      //         );
                      //       }

                      //       return ListView(
                      //         children: snapshot.data.docs.map((document) {
                      //             if(document['userType']=='user'){
                      //               return DoctorListField(
                      //             name: document["firstName"],
                      //             bio: document["bio"],
                      //           );
                      //             }
                      //         }).toList()
                      //       );
                      //     }),
                     
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
                            ),
                        onPressed: () {Navigator.pop(context);}),
                    IconButton(
                        icon: Image.asset(
                          
                          'assets/icons/user.png',color: kPrimaryColor
                        ),
                        onPressed: () {
                          }),
              ],
            ),
          )),
    );
  }
}
