import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saeed_fyp/Screens/Booking/booking.dart';
import 'package:saeed_fyp/Screens/Home/Home.dart';
import 'package:saeed_fyp/Screens/Profile/UserProfile.dart';
import 'package:saeed_fyp/Screens/Sesseion/session.dart';

import '../../constants.dart';

class NavigationPage extends StatefulWidget {
  //final User user;
  NavigationPage({
    Key key,
    //this.user,
  }) : super(key: key);
  @override
  createState() => _NavigationPageState(
      //user,
      );
}

class _NavigationPageState extends State<NavigationPage> {
  //final User user;
  _NavigationPageState(
      //this.user,
      );

  PageController _pageController;
  int pageIndex = 0;
  bool _doctor = false;
  // void checkUserIsDoctor() {
  //   if (user.userType == "doctor")
  //     setState(() {
  //       _doctor = true;
  //     });
  //   setState(() {
  //     _doctor = false;
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //checkUserIsDoctor();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.bounceIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        children: <Widget>[
          MyHomePage(),
          BookingPage(),
          SessionPage(),
          UsersProfile()
        ],
        controller: _pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: CupertinoTabBar(
              border: Border(top: BorderSide(color: Colors.white)),
              backgroundColor: Colors.white,
              
              currentIndex: pageIndex,
              onTap: onTap,
              activeColor: kPrimaryColor,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.whatshot_outlined),label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined),label: 'Booking'),
                BottomNavigationBarItem(icon: Icon(Icons.history_outlined),label: 'Session'),
                BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),label: 'Profile'),
              ]),
        ),
      ),
    );
  }
}
