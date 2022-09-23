import 'package:flutter/material.dart';
import 'package:odc/presentation/views/custom_appbar.dart';
import 'package:odc/presentation/views/custom_lec_card.dart';
import 'package:odc/presentation/widgets/custom_divider.dart';

class FinalScreen extends StatelessWidget {
  FinalScreen({Key? key}) : super(key: key);
  List<CustomCard> finals = [
    CustomCard(
      title: 'Flutter',
      type: 'Exam',
      day: '2022-08-18',
      Stime: '12:00pm',
      Etime: '2:00pm',
    ),
    CustomCard(
      title: 'React',
      type: 'Exam',
      day: '2022-08-20',
      Stime: '12:00pm',
      Etime: '2:00pm',
    ),
    CustomCard(
      title: 'Vue',
      type: 'Exam',
      day: '2022-08-18',
      Stime: '2:00pm',
      Etime: '4:00pm',
    ),
    CustomCard(
      title: 'Php',
      type: 'Exam',
      day: '2022-06-05',
      Stime: '12:00pm',
      Etime: '2:00pm',
    ),
    CustomCard(
      title: 'Angular',
      type: 'Exam',
      day: '2022-08-7',
      Stime: '12:00pm',
      Etime: '2:00pm',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          onpressed: (){
          Navigator.pop(context);
        },
          title: 'Finals',
        ),
        body: ListView.separated(
          itemBuilder: (context, index) => finals[index],
          separatorBuilder: (context, index) => CustomDivider(),
          itemCount: finals.length,
        ));
  }
}
