import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saeed_fyp/Screens/model/mysql.dart';
import 'package:saeed_fyp/Screens/model/user.dart';
import 'package:saeed_fyp/Screens/services/helper.dart';
import 'package:saeed_fyp/Screens/update/components/background.dart';
import 'package:saeed_fyp/components/text_field_container.dart';
import 'package:saeed_fyp/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../main.dart';

File _image;

class Update extends StatefulWidget {
  User user;
  Update({Key key, this.user}) : super(key: key);
  @override
  createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final ImagePicker _imagePicker = ImagePicker();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _languageController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  GlobalKey<FormState> _key = new GlobalKey();
  AutovalidateMode _validate = AutovalidateMode.disabled;
  Mysql db = new Mysql();

  Future<List<String>> updateProfile() async {
    List<User> result = [];
    db.getConnection().then((conn) {
      // String sql = 'select * from symptomchecker.querytable where answer=?',[''];
      conn.query(
          'update symptomchecker.users  set username=?,firstname=?,lastname=?,bio=?,language=?  where id=?',
          [
            _usernameController.text,
            _firstNameController.text,
            _lastNameController.text,
            _bioController.text,
            _languageController.text,
            int.parse(MyAppState.currentUser.id.toString())
          ]).then((results) {}, onError: (error) {
        print('$error');
      }).whenComplete(() {
        conn.close();
      });
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // String firstName, lastName, email, mobile, password, confirmPassword;

    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Positioned(
                  top: 0,
                  child: AppBar(
                    elevation: 0.0,
                    centerTitle: true,
                    title: Text(
                      'Edit Information',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.transparent,
                  )),
              SizedBox(
                width: size.width,
                height: size.height * .78,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),
                  child: Stack(
                    children: <Widget>[
                      //this column will be use to show the list of doctors
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Form(
                                key: _key,
                                autovalidateMode: _validate,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0,
                                          top: 32,
                                          right: 8,
                                          bottom: 8),
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: <Widget>[
                                          CircleAvatar(
                                            radius: 65,
                                            backgroundColor:
                                                Colors.grey.shade400,
                                            child: ClipOval(
                                              child: SizedBox(
                                                width: 170,
                                                height: 170,
                                                child: _image == null
                                                    ? Image.asset(
                                                        'assets/images/place_holder.png',
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Image.file(
                                                        _image,
                                                        fit: BoxFit.cover,
                                                      ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 80,
                                            right: 0,
                                            child: FloatingActionButton(
                                                backgroundColor: kPrimaryColor,
                                                child: Icon(Icons.edit),
                                                mini: true,
                                                onPressed: _onCameraClick),
                                          )
                                        ],
                                      ),
                                    ),
                                    TextFieldContainer(
                                        child: TextFormField(
                                            controller: _usernameController,
                                            validator: validateName,
                                            textInputAction:
                                                TextInputAction.next,
                                            onFieldSubmitted: (_) =>
                                                FocusScope.of(context)
                                                    .nextFocus(),
                                            decoration: InputDecoration(
                                                hintText: MyAppState
                                                    .currentUser.username
                                                    .toString(),
                                                border: InputBorder.none))),
                                    TextFieldContainer(
                                        child: TextFormField(
                                            controller: _firstNameController,
                                            validator: validateName,
                                            textInputAction:
                                                TextInputAction.next,
                                            onFieldSubmitted: (_) =>
                                                FocusScope.of(context)
                                                    .nextFocus(),
                                            decoration: InputDecoration(
                                                hintText: MyAppState
                                                    .currentUser.firstname
                                                    .toString(),
                                                border: InputBorder.none))),
                                    TextFieldContainer(
                                      child: TextFormField(
                                          controller: _lastNameController,
                                          validator: validateName,
                                          textInputAction: TextInputAction.next,
                                          onFieldSubmitted: (_) =>
                                              FocusScope.of(context)
                                                  .nextFocus(),
                                          decoration: InputDecoration(
                                              hintText: MyAppState
                                                  .currentUser.lastname
                                                  .toString(),
                                              border: InputBorder.none)),
                                    ),
                                    TextFieldContainer(
                                      child: TextFormField(
                                          controller: _bioController,
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.next,
                                          onFieldSubmitted: (_) =>
                                              FocusScope.of(context)
                                                  .nextFocus(),
                                          decoration: InputDecoration(
                                              hintText: MyAppState
                                                  .currentUser.bio
                                                  .toString(),
                                              border: InputBorder.none)),
                                    ),
                                    TextFieldContainer(
                                      child: TextFormField(
                                          controller: _languageController,
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.next,
                                          onFieldSubmitted: (_) =>
                                              FocusScope.of(context)
                                                  .nextFocus(),
                                          decoration: InputDecoration(
                                              hintText: MyAppState
                                                  .currentUser.language
                                                  .toString(),
                                              border: InputBorder.none)),
                                    ),
                                  ],
                                )),
                          )
                        ],
                      ),
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
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Update',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
            ),
            IconButton(
              icon: Image.asset('assets/icons/updated.png'),
              onPressed: () {
                updateProfile();
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
              },
            )
          ])),
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

  submitAction(BuildContext context) {}
}
