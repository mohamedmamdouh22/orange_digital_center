import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.title, required this.type, required this.day, required this.Stime, required this.Etime});

  final String title;
  final String type;
  final String day;
  final String Stime;
  final String Etime;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Card(
      elevation: 5,
      shadowColor: Colors.grey,
      margin: EdgeInsets.symmetric(horizontal: size.width/20,vertical: size.height/30),
      child: Padding(
        padding:  EdgeInsets.all(size.width/25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.alarm,
                      color: Colors.black,
                    ),
                    Text(
                      '2hrs',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: size.height/50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$type Day',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  'Start Time',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  'End Time',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: size.height/50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(FontAwesomeIcons.calendarDays),
                    SizedBox(width: size.width/50,),
                    Text(day)
                  ],
                ),
                Row(
                  children: [
                    Icon(FontAwesomeIcons.solidClock,color: Colors.green,),
                    SizedBox(width: size.width/50,),
                    Text('12:00')
                  ],
                ),
                Row(

                  children: [
                    Icon(FontAwesomeIcons.solidClock,color: Colors.red,),
                    SizedBox(width: size.width/50,),
                    Text('2:00')
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
