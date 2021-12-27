// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:green_notes/utilities/constants/app_constants.dart';


class CustomTextField extends StatelessWidget {
  CustomTextField({required this.hintText, this.suffixIcon});

  final String hintText;
  
  IconButton? suffixIcon;

  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide(
      color: Colors.black.withOpacity(0.1),
      width: 0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
         height: 51,
        child: TextFormField(
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 16, left: 20),
              enabledBorder: outlineInputBorder,
              focusedBorder: outlineInputBorder,
              fillColor: AppColors.textFieldColor,
              filled: true,
              hintText: hintText,
              hintStyle: AppTextStyles.textFieldHint,
              suffixIcon: suffixIcon),
        ),
      ),
    );
  }
}
