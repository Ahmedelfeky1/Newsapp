import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../data/model/news_model.dart';
import '../../data/servies/hive_services.dart';

class CustomTrandingNews extends StatelessWidget {
  final NewsModel news;
  final void Function()? onTap;

  const CustomTrandingNews({super.key, required this.news, this.onTap});

  @override
  Widget build(BuildContext context) {
    final box = BookmarkService.box;
    return ListTile(
      onTap: onTap,
      leading: SizedBox(
        width: 120,
        child: Image(image: NetworkImage(news.image), fit: BoxFit.cover),
      ),
      title: Text(
        news.title,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          color: Color(0xff141414),
          fontSize: 15,
          fontFamily: "Times",
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        news.source,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(
          color: Color(0xff141414),
          fontSize: 12,
          fontFamily: "Times",
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            news.time.split("T")[1].split("Z")[0],
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: Color(0xff141414),
              fontSize: 10,
              fontFamily: "Times",
              fontWeight: FontWeight.w700,
            ),
          ),
          ValueListenableBuilder(
            valueListenable: box.listenable(),
            builder: (context,Box<NewsModel> box, _) {
              final isBookmarked=box.containsKey(news.title);
              return IconButton(onPressed: () {
                BookmarkService.toggleBookmark(news);
              }, icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: isBookmarked ? Color(0xffC53030) : Color(0xff141414),
              ));
            },
          ),
        ],
      ),
    );
  }
}
