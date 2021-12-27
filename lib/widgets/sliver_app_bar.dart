import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_notes/utilities/constants/app_constants.dart';



class CustomAppBar2 extends StatelessWidget {
  final String text;
  const CustomAppBar2({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      title: Text(text),
      titleTextStyle: AppTextStyles.appBarHeader,
      actions: [
        IconButton(
            onPressed: () => print('pressed'),
            icon: const Icon(FontAwesomeIcons.ellipsisV)),
      ],
      backgroundColor: AppColors.appBarColor,
      centerTitle: true,
      expandedHeight: 200,
      pinned: true,
      elevation: 0,
    );
  }
}
