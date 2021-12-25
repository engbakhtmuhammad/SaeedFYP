import 'dart:math';

import 'package:flutter/material.dart';
import 'package:saeed_fyp/Screens/Profile/TutorProfile.dart';
import 'package:saeed_fyp/constants.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({ Key key }) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
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
                      'Book a Tutor',
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
          SizedBox(height: 10,),
          SwitchListTile(
            
            title: Text('Filter by your School',style: TextStyle(color: kBMediumColor,fontWeight: FontWeight.bold,fontSize: 18),),
            activeColor: kPrimaryColor, onChanged: (bool value) {  }, value: true,),
          ListView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: 15,
            itemBuilder: (context,index){
            return  TutorProfileField(size: size,name: 'Saeed $index',description: 'The smartest person $index',review: 4,onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => TutorProfile(),)));
          })
          ]),
      ),
    );
  }

  
}

class TutorProfileField extends StatelessWidget {
  const TutorProfileField({
    Key key,
    @required this.size, this.description,this.name,this.onTap,this.review
  }) : super(key: key);

  final Size size;
  final String name;
  final String description;
  final Function onTap;
  final int review;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: kPrimaryColor,
        child: Text(name[0],style: TextStyle(color: Colors.white)),
      ),
      title: Text(name,style: TextStyle(color: kBMediumColor)),
      subtitle: Text(description,style: TextStyle(color: Colors.grey)),
      trailing: SizedBox(
        width: size.width*.26,
        
        child: Row(
          children: [
            Icon(Icons.star,color: Colors.amber,),Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('$review Review',style: TextStyle(color: kBMediumColor)),
            )
          ],
        ),
      ),
    ),
          ),
          
    );
  }
}