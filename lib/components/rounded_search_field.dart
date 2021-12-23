import 'package:flutter/material.dart';

import '../constants.dart';
import 'search_text_field.dart';

class RoundedSearchField extends StatelessWidget {
  final TextEditingController searchController;
  final String hintText;
  final IconData icon;
  final Function onPressed;
  final ValueChanged<String> onChanged;
  const RoundedSearchField({
    Key ? key,
    required this.searchController,
    required this.hintText,
    this.icon = Icons.search,
    required this.onPressed,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchFieldContainer(
      child: TextField(
        //onSubmitted: onPressed,
        controller: searchController,
        onChanged: onChanged,
        cursorColor: kBackgroundColor,
        decoration: InputDecoration(
          icon: IconButton(
            icon: Icon(Icons.search,
            color: kBackgroundColor,
            size: 25,
            
          ), onPressed: (){}),
          suffixIcon: IconButton(
            icon: Icon(Icons.keyboard_voice_outlined),
            //onPressed open voice keyboard
            onPressed: () {},
            color: kBackgroundColor,
            iconSize: 20,
          ),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 13),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
