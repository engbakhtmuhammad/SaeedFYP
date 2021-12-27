
import 'package:flutter/material.dart';
import 'package:saeed_fyp/Screens/Admin/components/background.dart';
import 'package:saeed_fyp/Screens/Login/loginScreen.dart';
import 'package:saeed_fyp/Screens/model/user.dart';
import 'package:saeed_fyp/components/doctorList_field.dart';
import 'package:saeed_fyp/components/rounded_search_field.dart';
import 'package:saeed_fyp/constants.dart';
import 'package:saeed_fyp/Screens/model/mysql.dart';
import 'package:saeed_fyp/Screens/signUp/signUpScreen.dart';

class ShowUserPage extends StatefulWidget {
  ShowUserPage({Key key, }) : super(key: key);
  @override
  createState() => _ShowUserPageState();
}

class _ShowUserPageState extends State<ShowUserPage> {
  _ShowUserPageState();
    Mysql db = new Mysql();
   List<String> listName = [];
  List<String> listID = [];
  List<String> listBio = [];
    Future<List<String>> getUserSearch() async {
    List<User> result = [];
    db.getConnection().then((conn) {
      // String sql = 'select * from symptomchecker.querytable where answer=?',[null];
      conn.query('select * from symptomchecker.users where usertype=?',
          ['user']).then((results) {
        for (var row in results) {
          // print(row.fields);
          row.fields.forEach((key, value) {
            if (key == 'username') {
              listName.add(value);
            }
            if (key == 'id') {
              listID.add(value.toString());
            }
            if (key == 'bio') {
              listBio.add(value.toString());
            }
          });
        }
      }, onError: (error) {
        print('$error');
      }).whenComplete(() {
        conn.close();
      });
    });
    print(listBio.first.toString());
    return listName;
  }
  @override
  void initState() {
    getUserSearch();
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
                      'All Users',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.transparent,
                  )),
              RoundedSearchField(
                hintText: 'Search here',
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
                child: Positioned(
                  bottom: 0,
                  child: Stack(
                    children: <Widget>[
                     listName!=null?
                      ListView.builder(
                        itemCount: listName.length,
                        itemBuilder:   (context,index){
                        return DoctorListField(
                          name: listName[index],
                          bio: listBio[index],
                        );
                      }):Center(child: Text('No doctors found'),)
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
