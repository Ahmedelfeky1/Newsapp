import 'package:flutter/material.dart';
import '../../data/model/news_model.dart';
import '../../data/servies/api_services.dart';
import '../widget/custom_text_field.dart';
import '../widget/custom_tranding_news.dart';
import 'details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  final ApiServies apiServies=ApiServies();
  List <NewsModel> result = [];
  void search (String q)async{
    final data=await apiServies.searchNews(q: q);
    setState(() {
      result=data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: [
              SizedBox(height: 80,),
              CustomTextField(
                controller: searchController,
                validator: (value)=>null,
                hintText: "Search News ...",
              suffixIcon: Icon(Icons.search),
                onChanged: search,
              ),
              SizedBox(height: 20,),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 1);
                  },
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.vertical,
                  itemCount: result.length,
                  itemBuilder: (context, index) {
                    final neww = result[index];
                    return CustomTrandingNews(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsScreen(news: neww)));
                        },
                        news: neww);
                  },
                ),
              ),
            ],
          ),
      ),
    );

  }
}
