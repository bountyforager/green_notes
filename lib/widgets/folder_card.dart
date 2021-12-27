import 'package:flutter/material.dart';
import '../utilities/constants/app_constants.dart';


class FolderCard extends StatelessWidget {
  final String folderName;

  const FolderCard({
    Key? key,
    required this.folderName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Color(0xFFFCF0F0),
          border: Border.all(width: 0, color: Colors.black.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(flex: 1 ,child: Text(folderName, style: AppTextStyles.folderHeader, overflow: TextOverflow.ellipsis,)),
              Flexible(child: InkWell(onTap: () => print('pressed'), child: const Text('Icon'))),
            ],
          ),
        ));
  }
}
