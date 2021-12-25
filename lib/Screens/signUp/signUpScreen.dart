import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saeed_fyp/Screens/model/user.dart';
import 'package:saeed_fyp/Screens/services/helper.dart';
import 'package:saeed_fyp/Screens/signUp/background.dart';
import 'package:saeed_fyp/components/rounded_button.dart';
import 'package:saeed_fyp/components/text_field_container.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants.dart';


File _image;

class SignUpScreen extends StatefulWidget {
 User user;
  SignUpScreen({this.user});
  @override
  State createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final ImagePicker _imagePicker = ImagePicker();
  TextEditingController _passwordController = new TextEditingController();
  GlobalKey<FormState> _key = new GlobalKey();
  AutovalidateMode _validate = AutovalidateMode.disabled;
  String firstName, lastName, email, mobile, password, confirmPassword, userType = "user";

  TextEditingController _controller1;
  TextEditingController _controller2;
  TextEditingController _controller3;
  TextEditingController _controller4;
  TextEditingController _controller5;
  TextEditingController _controller6;
  TextEditingController _controller7;
  TextEditingController _controller8;
  bool validate1 = true;
  bool validate2 = true;
  bool validate3 = true;
  bool validate4 = true;
  bool validate5 = true;
  bool validate6 = true;
  bool validate7 = true;
  bool validate8 = true;

  String value;

  isDefault(User user) {
    if (user.firstname == '' && user.lastname == '') {
      return true;
    } else {
      return false;
    }
  }

@override
void initState() {
  if (widget.user == null) widget.user = new User.def();
  _controller1 = TextEditingController();
  _controller1.text = widget.user.username;
  _controller2 = TextEditingController();
  _controller2.text = widget.user.firstname;
  _controller3 = TextEditingController();
  _controller3.text = widget.user.lastname;
  _controller4 = TextEditingController();
  _controller4.text = widget.user.mail;
  _controller5 = TextEditingController();
  _controller5.text = widget.user.bio;
  _controller6 = TextEditingController();
  _controller6.text = widget.user.usertype;
  _controller7 = TextEditingController();
  _controller7.text = widget.user.language;
  _controller8 = TextEditingController();
  _controller8.text = widget.user.hash;
  super.initState();
}


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Scaffold(

      body:  Stack(
          children: [
        Container(height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [kBackgroundColor,kPrimaryColor])),),
            Positioned(
                top: 0,
                child: AppBar(
                  centerTitle: true,
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                )),
            Padding(
              padding:  EdgeInsets.only(left:size.width*.3,right:size.width*.3,top: 30,bottom: 20),
              child: Text(
                'Registration',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold,fontSize: 26),
              ),
            ),



            Positioned(
              top: size.height * .1,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width,
                      height: size.height * .9,
                      child: Container(

                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(35),
                                  topRight: Radius.circular(35))),
                          child: SingleChildScrollView(
                            child: Form(
                                key: _key,
                                autovalidateMode: _validate,
                                child: formUI()),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            // Positioned(
            //   top: size.height * .13,
            //   left: size.width / 2 - size.height * 0.08,
            //   child: CircleAvatar(
            //     radius: size.height * .08,
            //     backgroundColor: Colors.transparent,
            //     child: ClipOval(
            //       child: SizedBox(
            //         width: 170,
            //         height: 170,
            //         child: _image == null
            //             ? Image.asset(
            //                 'assets/images/placeholder.jpg',
            //                 fit: BoxFit.cover,
            //               )
            //             : Image.file(
            //                 _image,
            //                 fit: BoxFit.cover,
            //               ),
            //       ),
            //     ),
            //   ),
            //),
            // Positioned(
            //   top: size.height * .23,
            //   left: size.width / 2 - size.height * .14,
            //   right: 0,
            //   child: FloatingActionButton(
            //       backgroundColor: kPrimaryColor,
            //       child: Icon(Icons.camera_alt),
            //       mini: true,
            //       onPressed: _onCameraClick),
            // )
          ],
        ),
    );
  }

  // _onCameraClick() {
  //   final action = CupertinoActionSheet(
  //     message: Text(
  //       "Add profile picture",
  //       style: TextStyle(fontSize: 15.0),
  //     ),
  //     actions: <Widget>[
  //       CupertinoActionSheetAction(
  //         child: Text("Choose from gallery"),
  //         isDefaultAction: false,
  //         onPressed: () async {
  //           Navigator.pop(context);
  //           PickedFile image =
  //               await _imagePicker.getImage(source: ImageSource.gallery);
  //           if (image != null)
  //             setState(() {
  //               _image = File(image.path);
  //             });
  //         },
  //       ),
  //       CupertinoActionSheetAction(
  //         child: Text("Take a picture"),
  //         isDestructiveAction: false,
  //         onPressed: () async {
  //           Navigator.pop(context);
  //           PickedFile image =
  //               await _imagePicker.getImage(source: ImageSource.camera);
  //           if (image != null)
  //             setState(() {
  //               _image = File(image.path);
  //             });
  //         },
  //       )
  //     ],
  //     cancelButton: CupertinoActionSheetAction(
  //       child: Text("Cancel"),
  //       onPressed: () {
  //         Navigator.pop(context);
  //       },
  //     ),
  //   );
  //   showCupertinoModalPopup(context: context, builder: (context) => action);
  // }

  Widget formUI() {
    final universities = [
      'COMSATS Institute of Information Technology',
      'Air University, Islamabad',
      'Bahria University, Islamabad',
      'Capital University of Science and Technology, Islamabad,''Fatima Jinnah Women University, Rawalpindi',
      'H.E.J Research Institute of Chemistry,University of Karachi,Karachi.',
      'Forman Christian College, Lahore',
      'Ghulam Ishaq Khan Institute of Engineering Sciences & Technology, Topi',
      'Government College University, Lahore',
      'Institute of Business Administration, Karachi',
      'Institute of Business Management, Karachi',
      'Institute of Management Science, Peshawar (IMS)',
      'Institute of Space Technology, Islamabad (IST)',
      'International Islamic University, Islamabad',
      'Islamia College University, Peshawar',
      'Lahore College for Women University, Lahore',
      'Lahore University of Management Sciences (LUMS), Lahore',
      'Mehran University of Engineering & Technology, Jamshoro',
      'National Center of Excellence in Molecular Biology, University of Punjab,Lahore.',
      'National Institute of Bio Technology & Genetic Engg.,FaisalAbad.',
      'National Institute of Psychology, Quai-e-Azam University,Isb.',
      'BUITEMS,Quetta',
      'Mirpur University of Science and Technology (MUST), AJ&K',
      'Muhammad Ali Jinnah University, Karachi',
      'National University of Computer and Emerging Sciences, Islamabad,Karachi,Lahore',
      'National University of Sciences & Technology, Rawalpindi/Islamabad (NUST)',
      'NED University of Engineering & Technology, Karachi',
      'Pakistan Institute of Development Economics (PIDE), Islamabad',
      'Pakistan Institute of Engineering & Applied Sciences, Islamabad (PIEAS)',
      'Quaid-i-Azam University, Islamabad',
      'Shah Abdul Latif University, Khairpur',
      'The University of Agriculture, Peshawar,'
          'University of Agriculture, Faisalabad',
      'University of Balochistan, Quetta',
      'University of Central Punjab, Lahore',
      'University of Engineering & Technology, Lahore',
      'University of Engineering & Technology, Peshawar',
      'University of Engineering & Technology, Taxila',
      'University of Education, Lahore',
      'University of Karachi, Karachi',
      'University of Peshawar, Peshawar',
      'University of Sindh, Jamshoro',
      'University of the Punjab, Lahore',
      'University of Veterinary and Animal Sciences, Lahore',
      'Sindh Agriculture University, Tandojam,Hyderabad',
      'Sukkur Institute of Business Administration,Sukkur',
      'University of Balochistan,Quetta',
      'University of Health Sciences,Lahore',
      'DOW University of Health Sciences',
      'Dawood University of Engineering & Technology',
      'Government College University,FaisalAbad',
      'King Edward Medical University',
      'Kinnaird College for Women',
      'National Defense University,Islamabad',
      'Balochistan University of Engineering & Technology',
      'Information Technology University of the Punjab,Lahore',
      'Khyber Medical University,Peshawar',
      'National College of Arts,Lahore',
      'National Textile University,FaisalAbad',
      'National University of Medical Sciences,Rawalpindi',
      'Pakistan Institute of Fashion & Design,Lahore',
      'Quaid-e-Awam University of Engineering, Sciences & Technology,NawabShah',
      'Sir Syed University of Engineering & Technology,Karachi',
      'University of Azad Jammu & Kashmir,Muzaffarabad'
      ,'Liaquat University of Medical & Health Sciences,Jamshoroo'

          'National University of Modern Languages,Islamabad.'];
    int _value = 1;
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * .05),
          Text(
            'What is your role ?',
            style: TextStyle(color: kBMediumColor,fontWeight: FontWeight.w500,fontSize: 18),
          ),
         Row(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
           Row(

             children: [
               Radio(
                 activeColor: kBMediumColor,
                 value: 1,
                 groupValue: _value,
                 onChanged: (value){
                   setState(() {
                     value = _value;
                   });
                 },
               ),
               SizedBox(height: 10,),
               Text('Student'),

             ],),
           Row(
             children: [
               Radio(
                 value: 2,
                 groupValue: _value,
                 onChanged: (value){
                   setState(() {
                     value = _value;
                   });
                 },
               ),
               SizedBox(height: 10,),
               Text('Tutor'),

             ],),
         ],),
          // TextFieldContainer(
          //     child: TextFormField(
          //         validator: validateName,
          //         controller: _controller1,
          //         // onSaved: (String val) {
          //         //   firstName = val;
          //         // },
          //         textInputAction: TextInputAction.next,
          //         onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
          //         decoration: InputDecoration(
          //             hintText: 'Username', border: InputBorder.none))),
          TextFieldContainer(
            child: TextFormField(
                validator: validateName,
                controller: _controller2,
                // onSaved: (String val) {
                //   lastName = val;
                // },
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                decoration: InputDecoration(
                    hintText: 'First Name',hintStyle: TextStyle(color: kBMediumColor), border: InputBorder.none)),
          ),
          TextFieldContainer(
            child: TextFormField(
                validator: validateName,
                controller: _controller3,
                // onSaved: (String val) {
                //   lastName = val;
                // },
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                decoration: InputDecoration(
                    hintText: 'Last Name',hintStyle: TextStyle(color: kBMediumColor), border: InputBorder.none)),
          ),
          // TextFieldContainer(
          //   child: TextFormField(
          //       keyboardType: TextInputType.text,
          //       textInputAction: TextInputAction.next,
          //       onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
          //       validator: validateMobile,
          //       onSaved: (String val) {
          //         mobile = val;
          //       },
          //       decoration: InputDecoration(
          //           hintText: 'Phone Number', border: InputBorder.none)),
          // ),
          TextFieldContainer(
            child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                validator: validateEmail,
                controller: _controller4,
                // onSaved: (String val) {
                //   email = val;
                // },
                decoration: InputDecoration(
                    hintText: 'Email Address',hintStyle: TextStyle(color: kBMediumColor), border: InputBorder.none)),
          ),

          TextFieldContainer(
            child: TextFormField(
                obscureText: true,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                controller: _controller8,
                validator: validatePassword,
                // onSaved: (String val) {
                //   password = val;

                // },
                decoration: InputDecoration(
                    hintText: 'Password',hintStyle: TextStyle(color: kBMediumColor), border: InputBorder.none)),
          ),

          TextFieldContainer(
            child: TextFormField(
                obscureText: true,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                controller: _controller8,
                validator: validatePassword,
                // onSaved: (String val) {
                //   password = val;

                // },
                decoration: InputDecoration(
                    hintText: 'Confirm Password',hintStyle: TextStyle(color: kBMediumColor), border: InputBorder.none)),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 20,bottom: 10),
          //   child:
          // ),
          TextFieldContainer(
            child: SingleChildScrollView(
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint:  Text(
                    'Select a School ?',

                    style: TextStyle(color: kBMediumColor,fontWeight: FontWeight.w400),
                  ),
                    isExpanded: true,
                    value: value,
                    items: universities.map(buildMenuItem).toList(), onChanged: (value)=>setState(() {
                  this.value=value;
                })),
              ),
            ),
          )
          // TextFieldContainer(
          //   child: TextFormField(
          //       keyboardType: TextInputType.text,
          //       textInputAction: TextInputAction.next,
          //       onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
          //       validator: validateName,
          //       controller: _controller5,
          //       // onSaved: (String val) {
          //       //   email = val;
          //       // },
          //       decoration: InputDecoration(
          //           hintText: 'Bio', border: InputBorder.none)),
          // ),
          // TextFieldContainer(
          //   child: TextFormField(
          //       keyboardType: TextInputType.text,
          //       textInputAction: TextInputAction.next,
          //       onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
          //       validator: validateName,
          //       controller: _controller6,
          //       // onSaved: (String val) {
          //       //   email = val;
          //       // },
          //       decoration: InputDecoration(
          //           hintText: 'User type', border: InputBorder.none)),
          // // ),
          // TextFieldContainer(
          //   child: TextFormField(
          //       keyboardType: TextInputType.text,
          //       textInputAction: TextInputAction.next,
          //       onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
          //       validator: validateEmail,
          //       controller: _controller7,
          //       // onSaved: (String val) {
          //       //   email = val;
          //       // },
          //       decoration: InputDecoration(
          //           hintText: 'Language', border: InputBorder.none)),
          // ),

          // TextFieldContainer(
          //   child: TextFormField(
          //       textInputAction: TextInputAction.done,
          //       onFieldSubmitted: (_) {
          //         //_sendToServer();
          //       },
          //       obscureText: true,
          //       validator: (val) =>
          //           validateConfirmPassword(_controller8.text, val),
          //       // onSaved: (String val) {
          //       //   confirmPassword = val;
          //       // },
          //       decoration: InputDecoration(
          //           hintText: 'Confirm Password', border: InputBorder.none)),
          // ),
          ,
          isDefault(widget.user)?
          RoundedButton(
            press: _sendToServer,
            text: "Sign Up",
          ):RoundedButton(
            press: _sendToServer,
            text: "Update",
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _image = null;
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();
    _controller7.dispose();
    _controller8.dispose();
    super.dispose();
  }

  _sendToServer() {
    String username = _controller1.text;
    String firstname = _controller2.text;
    String lastname = _controller3.text;
    String mail = _controller4.text;
    String bio = _controller5.text;
    //
    String usertype = 'user';
    String language = _controller7.text;
    String password = _controller8.text;

    widget.user =
    new User(username, firstname, lastname, mail,bio,usertype,language, password);
    Navigator.of(context).pop(widget.user);

    }
  
  DropdownMenuItem buildMenuItem(String uni) => DropdownMenuItem(
    value: uni ,
    child: Text(uni,overflow: TextOverflow.ellipsis,),
  );
}
