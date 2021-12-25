import 'package:flutter/material.dart';
import 'package:saeed_fyp/components/search_text_field.dart';
import 'package:saeed_fyp/constants.dart';

class RoundedSearchField extends StatelessWidget {
  final TextEditingController searchController;
  final String hintText;
  final IconData icon;
  final Function onPressed;
  final ValueChanged<String> onChanged;
  const RoundedSearchField({
    Key key,
    this.searchController,
    this.hintText,
    this.icon = Icons.search,
    this.onPressed,
    this.onChanged,
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
            
          ), onPressed: onPressed),
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
