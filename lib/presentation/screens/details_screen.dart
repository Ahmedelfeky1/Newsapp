import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../data/model/news_model.dart';
import '../../data/servies/hive_services.dart';



class DetailsScreen extends StatelessWidget {
  final NewsModel news;

  const DetailsScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              news.image,
              width: double.infinity,
              fit: BoxFit.cover,
              height: 500,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(
                    news.title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Times",
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        news.source,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Times",
                        ),
                      ),
                      SizedBox(width: 30),
                      Text(
                        news.time.split("T")[1].split("Z")[0],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Times",
                        ),
                      ),
                      Spacer(),
                      ValueListenableBuilder(
                        valueListenable: BookmarkService.box.listenable(),
                        builder: (context, Box<NewsModel> box, child) {
                          final isBookmarked = box.containsKey(news.title);

                          return IconButton(
                            onPressed: () {
                              BookmarkService.toggleBookmark(news);
                            },
                            icon: Icon(
                              isBookmarked
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              color: isBookmarked
                                  ? Color(0xffC53030)
                                  : Color(0xff141414),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Text(
                    news.description,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Times",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
