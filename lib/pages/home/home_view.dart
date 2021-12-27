// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_notes/models/app_models.dart';

import 'package:green_notes/pages/home/bloc/home_bloc.dart';
import 'package:green_notes/utilities/constants/app_constants.dart';

import 'package:green_notes/widgets/widgets.dart';

import 'bloc/home_bloc.dart';
import 'bloc/home_state.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<PopUpItem> _list = [
    PopUpItem(value: 1, name: 'View'),
    PopUpItem(value: 2, name: 'Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        title: Text('Home'),
        titleTextStyle: AppTextStyles.appBarHeader,
        actions: [
          PopupMenuButton(
              icon: Icon(
                FontAwesomeIcons.ellipsisV,
                size: 15,
                color: Colors.black,
              ),
              color: Color(0xFFFCF0F0),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
              itemBuilder: (ctx) {
                return _list.map((PopUpItem choice) {
                  return PopupMenuItem(child: Text(choice.name));
                }).toList();
              })
        ],
        elevation: 1,
        backgroundColor: AppColors.appBarColor,
        shadowColor: Colors.black.withOpacity(0.1),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            return Center(child: Text('Hello'));
          } else if (state is HomeLoadingState) {
            return Text('dgh');
          } else if (state is HomeLoadingSucceful) {
            
            return FutureBuilder<List<GreenContent>>(
                future: state.folders,
                builder: (context, snapshot) => Padding(
                      padding: const EdgeInsets.fromLTRB(24, 15, 24, 0),
                      child: CustomScrollView(
                        slivers: [
                          SliverSearch(),
                          SliverList(
                              delegate: SliverChildBuilderDelegate(
                            (context, i) =>
                                FolderCard(folderName: snapshot.data![i].name),
                            childCount: snapshot.data?.length,
                          ))
                        ],
                      ),
                    ));
          } else {
            return Text('g');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainColor,
        onPressed: () => print('pressed'),
        child: Icon(
          FontAwesomeIcons.plus,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
