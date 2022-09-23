import 'package:flutter/material.dart';
import 'package:odc/presentation/views/custom_appbar.dart';
import 'package:odc/presentation/views/custom_lec_card.dart';
import 'package:odc/presentation/widgets/custom_divider.dart';

class LecturesScreen extends StatelessWidget {
  LecturesScreen({Key? key}) : super(key: key);
  List<CustomCard> lectures = [
    CustomCard(
        title: 'Flutter',
        type: 'Lecture',
        day: 'Wednesday',
        Stime: '12:00',
        Etime: '2:00'),
    CustomCard(
        title: 'React',
        type: 'Lecture',
        day: 'Wednesday',
        Stime: '12:00',
        Etime: '2:00'),
    CustomCard(
        title: 'Vue',
        type: 'Lecture',
        day: 'Wednesday',
        Stime: '12:00',
        Etime: '2:00'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        onpressed: (){
          Navigator.pop(context);
        },
        title: 'Lectures',
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => CustomDivider(),
        itemBuilder: (context, index) => lectures[index],
        itemCount: lectures.length,
      ),
    );
  }
}
