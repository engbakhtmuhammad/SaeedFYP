import 'package:flutter/material.dart';

class SymptomsField extends StatefulWidget {
  final String symptom;
  final List slectedList;
  final int index;

  SymptomsField({Key key, this.symptom, this.slectedList, this.index})
      : super(key: key);

  @override
  _SymptomsFieldState createState() =>
      _SymptomsFieldState(symptom, slectedList, index);
}

class _SymptomsFieldState extends State<SymptomsField> {
  final String symptom;
  final List slectedList;
  final int index;
  _SymptomsFieldState(this.symptom, this.slectedList, this.index);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      SizedBox(
        height: size.height * .01,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          width: size.width,
          height: size.height * .065,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.teal[400]),
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                symptom,
                style: TextStyle(color: Colors.white),
              ),
            ),
            trailing: IconButton(
                icon: Icon(Icons.close),
                color: Colors.white,
                onPressed: () => setState(() {
                      slectedList.remove(index);
                    })),
          ),
        ),
      ),
    ]);
  }
}
