import 'package:flutter/material.dart';
import 'package:saeed_fyp/constants.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 10,
              ),
              child: Text(
                "Tutor Help",
                style: TextStyle(
                    color: kBMediumColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
            ),
          ),
          Text(
            'Tired of using a billboard to get clients? Or want to make some extra income? We got you covered! Krush streamlines the entire process from account creation, getting your first client, and collecting your payment!',
            style: TextStyle(fontSize: 18),textAlign: TextAlign.justify
          ),
          Padding(
            padding: EdgeInsets.only(top: 7, bottom: 5),
            child: Text(
              "Home",
              style: TextStyle(
                  color: kBMediumColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ),
          Text(
              'The home page is your dashboard: you can browse the upcoming sessions and keep track of your rating. You can click on an upcoming session to view the details of that session such as the student information, data, time, and location. ',style: TextStyle(fontSize: 18),textAlign: TextAlign.justify),
          Padding(
            padding: EdgeInsets.only(top: 7, bottom: 5),
            child: Text(
              "kBMediumColor",
              style: TextStyle(
                  color: kBMediumColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ),
          Text(
            
              'The availability section is where you set up your available times and set your meeting location. Further, you can browse your current availabilities and remove them if need be. To create a new availability simply select a date, start time, end time, and submit. Done! Easy right? Setting your location is just as easy, click on Set Location and at the bottom of the page enter the address where you want to hold your sessions.',style: TextStyle(fontSize: 18),textAlign: TextAlign.justify,)
        ]),
      ),
    );
  }
}
