import 'package:flutter/material.dart';
import 'package:odc/presentation/styles/colors.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  CustomAppbar({this.title = ''});

  final String title;

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> options =  [
      DropdownMenuItem(
        value: 'm',
        child: Text('All $title'),
      ),
      DropdownMenuItem(
        value: 'f',
        child: Text('Finished $title'),
      ),
      DropdownMenuItem(
        value: 'f',
        child: Text('Remaining $title'),
      ),
    ];
    Size size = MediaQuery.of(context).size;
    return AppBar(
      title: Text(
        title,
        overflow: TextOverflow.visible,
        style: TextStyle(color: Colors.black, fontSize: 24),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      actions: [
        DropdownButtonHideUnderline(
          child: DropdownButton(

            items:options ,
            icon: Icon(Icons.filter_alt,color: primaryColor,size:40),
            onChanged: (value) {},
          ),
        ),
        SizedBox(
          width: size.width / 50,
        )
      ],
      leading: const Icon(
        Icons.arrow_back_ios,
        color: primaryColor,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
