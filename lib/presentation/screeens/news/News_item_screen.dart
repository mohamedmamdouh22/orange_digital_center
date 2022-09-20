import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odc/data/models/main/news/news_model.dart';
import 'package:odc/presentation/styles/colors.dart';
import 'package:odc/presentation/views/news_card.dart';
import 'package:page_transition/page_transition.dart';

class NewsItemScreen extends StatelessWidget {
  NewsItemScreen({required this.news});

  NewsDataModel news;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                news.image!,
                height: size.height / 3,
                width: size.width,
                fit: BoxFit.contain,
              ),
              Positioned(
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: primaryColor,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(
                          context,
                          PageTransition(
                              type: PageTransitionType.topToBottomPop,
                              child: NewsCard(
                                news: news,
                              )));
                    },
                  )
                ),
                top: size.height / 25,
                left: size.width / 35,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width / 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  news.title!,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: size.height/50,),
                Text(news.date!,style: TextStyle(color: primaryColor),),
                SizedBox(height: size.height/50,),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    news.body!,
                    style: TextStyle(color: Colors.grey,fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
