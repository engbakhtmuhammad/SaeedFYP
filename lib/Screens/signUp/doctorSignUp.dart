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

class DoctorSignUpScreen extends StatefulWidget {
 User user;
  DoctorSignUpScreen({this.user});
  @override
  State createState() => _DoctorSignUpState();
}

class _DoctorSignUpState extends State<DoctorSignUpScreen> {
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
  TextEditingController _controller6=TextEditingController(text:'doctor');
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
  //_controller6 = TextEditingController();
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
    
      body: Background(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                child: AppBar(
                  centerTitle: true,
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                )),
            Positioned(
              top: size.height * .2,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width,
                      height: size.height * .8,
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
            Positioned(
              top: size.height * .13,
              left: size.width / 2 - size.height * 0.08,
              child: CircleAvatar(
                radius: size.height * .08,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: SizedBox(
                    width: 170,
                    height: 170,
                    child: _image == null
                        ? Image.asset(
                            'assets/images/placeholder.jpg',
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            _image,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * .23,
              left: size.width / 2 - size.height * .14,
              right: 0,
              child: FloatingActionButton(
                  backgroundColor: kPrimaryColor,
                  child: Icon(Icons.camera_alt),
                  mini: true,
                  onPressed: _onCameraClick),
            )
          ],
        ),
      ),
    );
  }

  _onCameraClick() {
    final action = CupertinoActionSheet(
      message: Text(
        "Add profile picture",
        style: TextStyle(fontSize: 15.0),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text("Choose from gallery"),
          isDefaultAction: false,
          onPressed: () async {
            Navigator.pop(context);
            PickedFile image =
                await _imagePicker.getImage(source: ImageSource.gallery);
            if (image != null)
              setState(() {
                _image = File(image.path);
              });
          },
        ),
        CupertinoActionSheetAction(
          child: Text("Take a picture"),
          isDestructiveAction: false,
          onPressed: () async {
            Navigator.pop(context);
            PickedFile image =
                await _imagePicker.getImage(source: ImageSource.camera);
            if (image != null)
              setState(() {
                _image = File(image.path);
              });
          },
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text("Cancel"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
    showCupertinoModalPopup(context: context, builder: (context) => action);
  }

  Widget formUI() {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: size.height * .1),
          TextFieldContainer(
              child: TextFormField(
                  validator: validateName,
                  controller: _controller1,
                  // onSaved: (String val) {
                  //   firstName = val;
                  // },
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  decoration: InputDecoration(
                      hintText: 'Username', border: InputBorder.none))),
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
                    hintText: 'First Name', border: InputBorder.none)),
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
                    hintText: 'Last Name', border: InputBorder.none)),
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
                    hintText: 'Email Address', border: InputBorder.none)),
          ),
          TextFieldContainer(
            child: TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                validator: validateName,
                controller: _controller5,
                // onSaved: (String val) {
                //   email = val;
                // },
                decoration: InputDecoration(
                    hintText: 'Bio', border: InputBorder.none)),
          ),
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
          // ),
          TextFieldContainer(
            child: TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                validator: validateEmail,
                controller: _controller7,
                // onSaved: (String val) {
                //   email = val;
                // },
                decoration: InputDecoration(
                    hintText: 'Language', border: InputBorder.none)),
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
                    hintText: 'Password', border: InputBorder.none)),
          ),

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
    String usertype = 'doctor';
    String language = _controller7.text;
    String password = _controller8.text;

    widget.user =
    new User(username, firstname, lastname, mail,bio,usertype,language, password);
    Navigator.of(context).pop(widget.user);

    }
  }
