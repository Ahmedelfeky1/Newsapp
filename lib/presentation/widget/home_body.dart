import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newset/presentation/screens/category_screen.dart';
import 'package:newset/presentation/screens/details_screen.dart';
import '../../business_logic/news_cubit.dart';
import 'custom_news_card.dart';
import 'custom_text_bt.dart';
import 'custom_tranding_news.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatefulWidget {
  HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final List<String> categories = [
    "general",
    "world",
    "nation",
    "business",
    "technology",
    "health",
    "science",
    "sports",
    "entertainment",
  ];
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().getNewsData(categories[0],index: 0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        if (state is NewsLoading) {
          return Center(child: SpinKitFoldingCube(color: Colors.red,));
        }
        if (state is NewsError) {
          return Center(child: Text("Can't Load Data"));
        }
        var list=cubit.newsList;
        var currentIndex=cubit.selectedCategoryIndex;
        if(list.isEmpty){
          return  Center(child: Text("No News Available"));
        }
        return Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bghome.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 80),
                      Image(image: AssetImage("assets/images/Vector.png")),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Trending News",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffFFFCFC),
                                fontFamily: "Times",
                              ),
                            ),
                            CustomTextBt(
                              text: "View all",
                              onPressed: () {},
                              colorText: Color(0xffFFFCFC),
                              fontSize: 14,
                              myDecoration: TextDecoration.underline,
                              decorationColor: Color(0xffFFFCFC),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -28,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 140,
                    child: ListView.builder(
                      itemCount: list.length,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 10),
                      itemBuilder: (context, index) {
                        final neww = list[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: CustomNewsCard(
                            title: neww.title,
                            image: neww.image,
                            source: neww.source,
                            time: neww.time.split("T")[1].split("Z")[0],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      fontFamily: "Times",
                    ),
                  ),
                  Spacer(),
                  CustomTextBt(
                    text: "View all",
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Category(
                            news: list,
                            title: categories[currentIndex],
                          ),
                        ),
                      );
                    },
                    colorText: Color(0xff141414),
                    fontSize: 14,
                    myDecoration: TextDecoration.underline,
                    decorationColor: Color(0xff141414),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        cubit.getNewsData(categories[index],index: index);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            fontFamily: "Times",
                            color: currentIndex == index
                                ? Color(0xffC53030)
                                : Color(0xff141414),
                            decoration: currentIndex == index
                                ? TextDecoration.underline
                                : null,
                            decorationColor: currentIndex == index
                                ? Color(0xffC53030)
                                : null,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 1);
                },
                padding: EdgeInsets.symmetric(horizontal: 10),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final neww = list[index];
                  return CustomTrandingNews(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (
                            context) => DetailsScreen(news: neww)));
                      },
                      news: neww);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
