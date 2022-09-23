import 'package:flutter/material.dart';
import 'package:odc/presentation/views/custom_lec_card.dart';

import '../../views/custom_appbar.dart';
import '../../widgets/custom_divider.dart';

class SectionsScreen extends StatelessWidget {
  SectionsScreen({Key? key}) : super(key: key);
  List<CustomCard> sectinos = [
    CustomCard(
      title: 'Flutter',
      type: 'section',
      day: 'Wednesday',
      Stime: '12:00pm',
      Etime: '2:00pm',
    ),
    CustomCard(
      title: 'React',
      type: 'section',
      day: 'Thursday',
      Stime: '12:00pm',
      Etime: '2:00pm',
    ),
    CustomCard(
      title: 'Vue',
      type: 'section',
      day: 'Thursday',
      Stime: '2:00pm',
      Etime: '4:00pm',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        onpressed:(){
          Navigator.pop(context);
        } ,
        title: 'Sections',
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => CustomDivider(),
        itemBuilder: (context, index) => sectinos[index],
        itemCount: sectinos.length,
      ),
    );
  }
}
