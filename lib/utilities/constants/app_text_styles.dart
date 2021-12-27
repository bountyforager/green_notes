import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_notes/utilities/constants/app_constants.dart';


class AppTextStyles {
  static TextStyle appBarHeader = GoogleFonts.poppins(
    color: AppColors.mainColor,
    fontWeight: FontWeight.w500,
    fontSize: 24,
  );

  static TextStyle textFieldHint = GoogleFonts.poppins(
    color: AppColors.textHintColor,
    fontWeight: FontWeight.w500,
  );


  static TextStyle folderHeader = GoogleFonts.poppins(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 15,
  );
}
