import 'package:flutter/material.dart';
import '../../data/model/cache_user_repo.dart';
import '../widget/custom_elvat_bt.dart';
import '../widget/custom_text_bt.dart';
import '../widget/on_board_body.dart';
import 'login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int curntPage = 0;
   String kOnboardingKey = "onboarding";

  final pageController = PageController();
  void nextPage() async{
    if(curntPage<2){
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }else{
      await CacheUserRepo.setBool(kOnboardingKey, true);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomTextBt(text: curntPage==2?"": "Skip", onPressed: ()async{
                  await CacheUserRepo.setBool(kOnboardingKey, true);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                }, colorText: Color(0xffC53030), fontSize: 14)
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                curntPage = index;
                setState(() {
                  curntPage = index;
                });
              },
              children: [
                OnBoardBody(
                  title: "Trending News",
                  subtitle:
                      "Stay in the loop with the biggest breaking stories in a stunning visual slider. Just swipe to explore what’s trending right now!",
                  image: "assets/images/Frame1.png",
                ),
                OnBoardBody(
                  title: "Pick What You Love",
                  subtitle:
                      "No more endless scrolling! Tap into your favorite topics like Tech, Politics, or Sports and get personalized news in seconds",
                  image: "assets/images/Frame2.png",
                ),
                OnBoardBody(
                  title: "Save It. Read It Later. Stay Smart.",
                  subtitle:
                      "Found something interesting? Tap the bookmark and come back to it anytime. Never lose a great read again!",
                  image: "assets/images/Frame3.png",
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index)=>Container(
            height: 8,
            width: curntPage==index?18:8,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: curntPage==index?Color(0xffC53030):Color(0xffD3D3D3),
            ),
            ))
          ),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CustomElvatBt(text: curntPage==2?"Get Started":"Next", onPressed: nextPage, width: double.infinity),
          ),
          SizedBox(height: 50,),
        ],
      ),
    );
  }
}
