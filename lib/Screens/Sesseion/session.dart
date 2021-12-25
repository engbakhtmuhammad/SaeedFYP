import 'package:flutter/material.dart';

class SessionPage extends StatefulWidget {
  const SessionPage({ Key key }) : super(key: key);

  @override
  _SessionPageState createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('SessionPage'),),
    );
  }
}