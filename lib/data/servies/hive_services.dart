import 'package:hive/hive.dart';

import '../model/news_model.dart';

class BookmarkService {
  static final box = Hive.box<NewsModel>('bookmarks');

  static bool isBookmarked(String title) {
    return box.containsKey(title);
  }

  static void toggleBookmark(NewsModel news) {
    if (isBookmarked(news.title)) {
      box.delete(news.title);
    } else {
      box.put(news.title, news);
    }
  }

  static List<NewsModel> getAllBookmarks() {
    return box.values.toList();
  }
}
