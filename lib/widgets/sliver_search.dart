import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_notes/utilities/constants/app_constants.dart';
import 'package:green_notes/widgets/widgets.dart';


class SliverSearch extends StatelessWidget {
  const SliverSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      
      floating: true,
      delegate: _SliverSearchDelegate(
        minHeight: 10,
        maxHeight: 60,
        child: Container(
          color: AppColors.appBarColor,
          child: Center(
            child: CustomTextField(
              hintText: 'Search',
              suffixIcon: const IconButton(
                  onPressed: null,
                  icon:  Icon(FontAwesomeIcons.search,
                      size: 10, color: Colors.black)),
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverSearchDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverSearchDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverSearchDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
