import 'package:flutter/material.dart';
import 'package:saeed_fyp/constants.dart';

class ViewReply extends StatelessWidget {
  final String string;
  const ViewReply({Key key,this.string}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View"),backgroundColor: kBackgroundColor,),
      body: Center(child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(string,style: TextStyle(fontSize: 16),),
      ),),
    );
  }
}
