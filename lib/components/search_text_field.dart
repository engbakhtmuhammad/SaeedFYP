import 'package:flutter/material.dart';

import '../constants.dart';

class SearchFieldContainer extends StatelessWidget {
  final Widget child;
  const SearchFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: size.width * 0.9,
      height: size.height * .08,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(35),
      ),
      child: child,
    );
  }
}
