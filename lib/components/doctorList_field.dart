import 'package:flutter/material.dart';
import 'package:saeed_fyp/constants.dart';

class DoctorListField extends StatelessWidget {
  final Function onTap;
  final String name;
  final String bio;

  const DoctorListField({Key key, this.onTap,this.name, this.bio})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Column(children: [
        SizedBox(
          height: size.height * .01,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            width: size.width,
            height: size.height * .1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: kPrimaryLightColor),
            child: ListTile(
    
               
               leading: CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    //radius: size.height * .04,
                    child: Center(child: Text(name[0].toUpperCase(),style: TextStyle(fontSize: 20),)),
                  ),
                  title: Text(name),
                  subtitle: Text(bio),

            )
          ),
        ),
      ]),
    );
  }
}
