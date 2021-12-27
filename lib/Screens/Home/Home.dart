import 'package:flutter/material.dart';
import 'package:saeed_fyp/Screens/Home/help.dart';
import 'package:saeed_fyp/Screens/Payment/credit_card.dart';
import 'package:saeed_fyp/Screens/Payment/payment.dart';
import 'package:saeed_fyp/Screens/Profile/UserProfile.dart';
import 'package:saeed_fyp/Screens/Welcome/welcome_screen.dart';
import 'package:saeed_fyp/Screens/services/helper.dart';
import 'package:saeed_fyp/Screens/update/components/body.dart';
import 'package:saeed_fyp/components/header.dart';
import 'package:saeed_fyp/constants.dart';
import 'package:saeed_fyp/main.dart';

import 'Course.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Builder(builder: (context) {
      return Scaffold(
        drawer: Drawer(
            child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Saeed khan Tareen'),
              accountEmail: Text('saeedkhan@gmail.com'),
              currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/bg.jpg')
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UsersProfile(),));
                  }),
              decoration: BoxDecoration(
                color: kBackgroundColor,
              ),
            ),
            
            ListTile(
                title: Text("Payment"),
                leading: Icon(Icons.payment),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreditCardsPage(),));
                }),
                ListTile(
                title: Text("Tutor Help"),
                leading: Icon(Icons.help),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HelpPage(),));
                }),
            ListTile(
                title: Text("Edit Information"),
                leading: Icon(Icons.edit),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Update(),));
                }),
            ListTile(
              title: Text("Log out"),
              leading: Icon(Icons.logout),
              onTap: () async {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen(),));
              },
            ),
            Divider(
              thickness: 1.0,
            ),
            ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.cancel),
              onTap: () => Navigator.pop(context),
            ),
          ],
        )),
        
          backgroundColor: Color(0xfff5f7fa),
          body: Column(
            children: [
            Stack(
              children: [
                
                Container(
                  height: size.height * .37,
                  width: size.width,
                ),
                GradientContainer(size),
                
                Positioned(
                    top: size.height * .12,
                    left: 30,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "The Trending",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 26),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 7, bottom: 5),
                            child: Text(
                              "Courses",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: [
                              CustomCard(size,context,'Python'),
                              CustomCard(size,context, 'Flutter'),
                              CustomCard(size,context, 'Firebase'),
                            ]),
                          ),
                        ]))
              ],
            ),
            SubjectGridDashboard(size: size),
            ScenesDashboard()
          ]));
    });
  }

  Padding CustomCard(Size size, context, String course) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Course(course: course,),)),
        child: Container(
          height: size.height * .15,
          width: size.width * .5,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage(
                  "assets/images/bg.jpg",
                ),
                fit: BoxFit.cover,
              )),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black.withOpacity(0.3),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 15, top: size.height * .12),
              child: Text(
                course,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container GradientContainer(Size size) {
    return Container(
      height: size.height * .27,
      width: size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            gradient: LinearGradient(colors: [
              kBackgroundColor.withOpacity(0.9),
              kPrimaryColor.withOpacity(0.9)
            ])),
      ),
    );
  }

}

class ScenesDashboard extends StatelessWidget {
  const ScenesDashboard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 30),
    child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Padding(
    padding: EdgeInsets.only(bottom: 5,top: 10),
    child: Text(
      "Scenes",
      style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17),
    ),
          ),
          SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        CardWidget(icon: Icon(Icons.home_work_rounded,color: kBackgroundColor,), title: 'Coming Home'),
        CardWidget(icon: Icon(Icons.home,color: kBackgroundColor,), title: 'At Home')
      ],
    ),
          )
    ],),);
  }
}

class CardWidget extends StatelessWidget {
  Icon icon;
  String title;
   CardWidget({
    Key key,
     this.icon,
     this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 50,
        width: 200,
        child: Center(child: ListTile(leading: icon,title: Text(
          title,
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14),
        ),),),
      ),
    );
  }
}

class SubjectGridDashboard extends StatelessWidget {
  const SubjectGridDashboard({
    Key key,
     this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              "Subjects",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardField(
                  size,
                  Colors.blue,
                  Icon(
                    Icons.web,
                    color: Colors.white,
                  ),
                  'Web Dev',
                  '8 course'),
              CardField(
                  size,
                  Colors.amber,
                  Icon(Icons.mobile_friendly, color: Colors.white),
                  'App Deve',
                  '18 course'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardField(
                  size,
                  Colors.orange,
                  Icon(Icons.flutter_dash, color: Colors.white),
                  'Flutter',
                  '2 course'),
              CardField(
                  size,
                  Colors.teal,
                  Icon(Icons.developer_board, color: Colors.white),
                  'Flask',
                  '8 course'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardField(
                  size,
                  Colors.purple,
                  Icon(Icons.wifi_outlined, color: Colors.white),
                  'Python',
                  '5 course'),
              CardField(
                  size,
                  Colors.green,
                  Icon(Icons.air_outlined, color: Colors.white),
                  'Java',
                  '4 course'),
            ],
          )
        ],
      ),
    );
  }
}

CardField(
  Size size,
  Color color,
  Icon icon,
  String title,
  String subtitle,
) {
  return Padding(
    padding: const EdgeInsets.all(2),
    child: Card(
        child: SizedBox(
            height: size.height * .1,
            width: size.width * .39,
            child: Center(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: color,
                  child: icon,
                ),
                title: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                subtitle: Text(
                  subtitle,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
            ))),
  );
}
