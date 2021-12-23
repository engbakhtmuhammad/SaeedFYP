
import 'package:flutter/material.dart';

import '../constants.dart';
import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _email, _password;

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return TextFieldContainer(
      child: TextFormField(
        validator: (input) {
          if (input!.isEmpty) {
            return "Enter email";
          }
        },
        onSaved: (input) => _email = input!,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
