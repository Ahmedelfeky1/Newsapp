import 'package:flutter/material.dart';

import '../../data/model/news_model.dart';
import '../widget/custom_tranding_news.dart';


class Category extends StatelessWidget {
  final List<NewsModel> news;
  final String title;

const Category({super.key, required this.news, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        },icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30,right: 1,left: 1),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height: 1);
          },
          padding: EdgeInsets.symmetric(horizontal: 10),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: news.length,
          itemBuilder: (context, index) {
            final neww = news[index];
            return CustomTrandingNews(
              news: neww ,
            );
          },
        ),
      ),
    );
  }
}
