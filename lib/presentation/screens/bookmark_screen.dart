import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart' show BoxX;
import '../../data/model/news_model.dart';
import '../../data/servies/hive_services.dart';
import '../widget/custom_tranding_news.dart';
import 'details_screen.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = BookmarkService.box;
    return ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (context, Box<NewsModel> box, _) {
        final newsList = box.values.toList();
        return box.isEmpty
            ? Center(child: Text("BookMark is Empty"))
            : Padding(
                padding: const EdgeInsets.only(top: 100),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 1);
                  },
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    final neww = newsList[index];
                    return CustomTrandingNews(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(news: neww),
                          ),
                        );
                      },
                      news: neww,
                    );
                  },
                ),
              );
      },
    );
  }
}
