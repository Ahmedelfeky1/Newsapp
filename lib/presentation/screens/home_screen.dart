import 'package:flutter/material.dart';
import 'package:newset/presentation/screens/search_screen.dart';
import '../widget/home_body.dart';
import 'Profile_screen.dart';
import 'bookmark_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  late List<Widget> pages = [
    Navigator(
      key: navigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (_) => HomeBody());
      },
    ),
    SearchScreen(),
    BookmarkScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xffC53030),
        unselectedItemColor: Color(0xff363636),
        selectedLabelStyle: TextStyle(fontSize: 12, fontFamily: "Times"),
        unselectedLabelStyle: TextStyle(fontSize: 12, fontFamily: "Times"),
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            if (index == currentIndex && index == 0) {
              navigatorKey.currentState?.popUntil((route) => route.isFirst);
            } else {
              setState(() {
                currentIndex = index;
              });
            }
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Bookmark",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: IndexedStack(index: currentIndex, children: pages),
    );
  }
}
