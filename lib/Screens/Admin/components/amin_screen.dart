import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saeed_fyp/Screens/Admin/components/background.dart';
import 'package:saeed_fyp/Screens/Admin/components/user_body.dart';
import 'package:saeed_fyp/Screens/Login/loginScreen.dart';
import 'package:saeed_fyp/Screens/model/DAO/DAO.dart';
import 'package:saeed_fyp/Screens/model/doctor.dart';
import 'package:saeed_fyp/Screens/model/mysql.dart';
import 'package:saeed_fyp/Screens/model/user.dart';
import 'package:saeed_fyp/Screens/signUp/doctorSignUp.dart';
import 'package:saeed_fyp/Screens/signUp/newUser.dart';
import 'package:saeed_fyp/components/doctorList_field.dart';
import 'package:saeed_fyp/components/rounded_search_field.dart';
import 'package:saeed_fyp/constants.dart';
import 'package:saeed_fyp/Screens/signUp/signUpScreen.dart';

class AdminScreen extends StatefulWidget {
  AdminScreen({
    Key key,
  }) : super(key: key);
  @override
  createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  _AdminScreenState();
  signUponPressed() async{
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DoctorSignUpScreen()))
        .then((newuser) {
      if (newuser != null) {
        dao.insertUser(newuser as User).then((_) {
          dao.db.getConnection().then((conn) async {
            String sql =
                'select id from symptomchecker.users where username = ?;';
            await conn.query(sql, [newuser.username]).then((results) {
              for (var row in results) {
                int id = row[0];
                newuser.id = id;
                setState(() async {
                  await users.add(newuser);
                });
              }
              conn.close();
            });
          });
        });
      }
    });
  }

  Mysql db = new Mysql();
  List<String> listDoctorName = [];
  List<String> listDoctorBio = [];
  List<String> listDoctorID = [];


  Future<List<String>> getdoctorSearch() async {
    List<User> result = [];
    db.getConnection().then((conn) async {
      // String sql = 'select * from symptomchecker.querytable where answer=?',[null];
     await conn.query('select * from symptomchecker.users where usertype=?',
          ['doctor']).then((results) {
        for (var row in results) {
          // print(row.fields);
          row.fields.forEach((key, value) async {
            if (key == 'username') {
              await listDoctorName.add(value);
            }
            if (key == 'id') {
              await listDoctorID.add(value.toString());
            }
            if (key == 'bio') {
              await listDoctorBio.add(value.toString());
            }
          });
        }
      }, onError: (error) {
        print('$error');
      }).whenComplete(() {
        conn.close();
      });
    });
    return listDoctorName;
  }

  @override
  void initState() {
    getdoctorSearch();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                onChanged: (value) {},
              ),
              Container(
                width: size.width,
                height: size.height * .6945,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: listDoctorName!=null?
                ListView.builder(
                  itemCount: listDoctorName.length,
                  itemBuilder:   (context,index){
                  return DoctorListField(
                    name: listDoctorName[index],
                    bio: listDoctorBio[index],
                  );
                }):Center(child: Text('No doctors found'),),
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
          onPressed: () => signUponPressed()),
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
