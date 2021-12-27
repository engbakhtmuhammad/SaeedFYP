

import 'package:flutter/material.dart';
import 'package:saeed_fyp/Screens/Profile/TutorProfile.dart';
import 'package:saeed_fyp/constants.dart';

class SessionPage extends StatefulWidget {
  const SessionPage({ Key key }) : super(key: key);

  @override
  _SessionPageState createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xfff5f7fa),
      body: SingleChildScrollView(
        child: Column(
          children: [Stack(
            children: [
              Container(height: size.height*.15,
              child: Center(
                child: Text(
                      'Session History',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold,fontSize: 26),
                    ),
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30,),bottomRight: Radius.circular(30)),
                gradient: LinearGradient(colors: [kBackgroundColor,kPrimaryColor])),),
                
            ],
            
          ),
          ListView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: 15,
            itemBuilder: (context,index){
            return  SessionHistoryField(size: size,name: 'Starbuck $index',description: 'unknown university $index',);
          })
          ]),
      ),
    );
  }

  
}

class SessionHistoryField extends StatelessWidget {
  const SessionHistoryField({
    Key key,
    @required this.size, this.description,this.name,
  }) : super(key: key);

  final Size size;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
    child: ListTile(
    leading: CircleAvatar(
      backgroundColor: kPrimaryColor,
      child: Text(name[0],style: TextStyle(color: Colors.white)),
    ),
    title: Text('Meeting at $name',style: TextStyle(color: kBMediumColor)),
    subtitle: Text(description,style: TextStyle(color: Colors.grey)),
    ),
        );
  }
}