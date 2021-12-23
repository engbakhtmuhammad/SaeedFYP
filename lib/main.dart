

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saeed_fyp/Screens/services/helper.dart';
import 'package:saeed_fyp/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/Welcome/welcome_screen.dart';
import 'Screens/model/DAO/DAO.dart';
import 'Screens/model/user.dart';
import 'onBoardingNew/onBoardingScreen.dart';

void main() => runApp(new MyApp());
class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver {
   static late User currentUser;
  //static Doctor currentDoctor;
  late StreamSubscription tokenStream;

  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return MaterialApp(
          home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(
              child: Column(
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 25,
              ),
              SizedBox(height: 16),
              Text(
                'Failed to initialise firebase!',
                style: TextStyle(color: Colors.red, fontSize: 25),
              ),
            ],
          )),
        ),
      ));
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    var dao = DAO();

    return StreamBuilder(
        stream: Stream.fromFuture(dao.getUsers()),
        builder: (context, response) {
          if (!response.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (response.hasError) {
            return Center(child: Text(response.error.toString()));
          } else {
            return MultiProvider(
                providers: [
                  Provider<List<User>>.value(
                    //value: response.data,
                  )
                ],
                child: MaterialApp(
        theme: ThemeData(//primarySwatch: kBackgroundColor,
        accentColor: kPrimaryColor),
        debugShowCheckedModeBanner: false,
        color: kBackgroundColor,
        home: OnBoarding()
        // home: WelcomeScreen(),
        ));
          }
        });

  
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<User>('currentUser', currentUser));
    properties.add(DiagnosticsProperty<User>('currentUser', currentUser));
  }

  //@override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (auth.FirebaseAuth.instance.currentUser != null && currentUser != null) {
  //     if (state == AppLifecycleState.paused) {
  //       //user offline
  //       tokenStream.pause();
  //       currentUser.active = false;
  //       currentUser.lastOnlineTimestamp = Timestamp.now();
  //       FireStoreUtils.updateCurrentUser(currentUser);
  //     } else if (state == AppLifecycleState.resumed) {
  //       //user online
  //       tokenStream.resume();
  //       currentUser.active = true;
  //       FireStoreUtils.updateCurrentUser(currentUser);
  //     }
  //   }
    
  // }
  
}

class OnBoarding extends StatefulWidget {
  @override
  State createState() {
    return OnBoardingState();
  }
}

class OnBoardingState extends State<OnBoarding> {
  Future hasFinishedOnBoarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool finishedOnBoarding = (prefs.getBool(FINISHED_ON_BOARDING) ?? false);

    if (finishedOnBoarding) {
      pushReplacement(context, WelcomeScreen());
      // auth.User firebaseUser = auth.FirebaseAuth.instance.currentUser;
      // //auth.User firebaseDoctor = auth.FirebaseAuth.instance.currentUser;
      // if (firebaseUser != null) {
      //   User user = await FireStoreUtils().getCurrentUser(firebaseUser.uid);
      //   if (user != null) {
      //     MyAppState.currentUser = user;
      //     pushReplacement(context,  Body());
      //   } else {
      //     pushReplacement(context, WelcomeScreen());
      //   }
      // }
      
      //  else {
      //   pushReplacement(context, WelcomeScreen());
      // }
    } else {
      pushReplacement(context, OnBoardingScreen());
    }
  }

  @override
  void initState() {
    super.initState();
    hasFinishedOnBoarding();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
