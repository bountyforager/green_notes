import 'package:flutter/material.dart';
import 'package:green_notes/models/app_models.dart';
import 'package:green_notes/pages/files/ddd.dart';

class FileView extends StatefulWidget {
  const FileView({Key? key}) : super(key: key);

  @override
  _FileViewState createState() => _FileViewState();
}

class _FileViewState extends State<FileView> {
  final _users = GreenRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder<List<GreenContent>>(
              future: _users.filesResults,
              builder: (ctx, snapshot) {
                if (snapshot.hasData) {
                  
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (ctx, i) {
                          return Container(child: Text(snapshot.data?[i].name?? 'f'));
                        }),
                  );
                }
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return Text('not working');
                }
              }),
        ],
      ),
    );
  }
}
