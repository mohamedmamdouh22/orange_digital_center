import 'package:flutter/material.dart';
import 'package:odc/presentation/views/custom_appbar.dart';
import 'package:odc/presentation/views/custom_lec_card.dart';
import 'package:odc/presentation/widgets/custom_divider.dart';

class MidtermScreen extends StatelessWidget {
  MidtermScreen({Key? key}) : super(key: key);
  List<CustomCard> midterms = [
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
      day: '2022-08-18',
      Stime: '12:00pm',
      Etime: '2:00pm',
    ),
    CustomCard(
      title: 'Vue',
      type: 'Exam',
      day: '2022-08-18',
      Stime: '12:00pm',
      Etime: '2:00pm',
    ),
    CustomCard(
      title: 'Php',
      type: 'Exam',
      day: '2022-08-18',
      Stime: '12:00pm',
      Etime: '2:00pm',
    ),
    CustomCard(
      title: 'Angular',
      type: 'Exam',
      day: '2022-08-18',
      Stime: '12:00pm',
      Etime: '2:00pm',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Midterms',
      ),
        body: ListView.separated(
      itemBuilder: (context, index) => midterms[index],
      separatorBuilder: (context, index) => CustomDivider(),
      itemCount: midterms.length,
    ));
  }
}
