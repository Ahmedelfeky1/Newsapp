import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newset/business_logic/news_cubit.dart';
import 'package:newset/presentation/screens/home_screen.dart';
import 'package:newset/presentation/screens/login_screen.dart';
import 'package:newset/presentation/screens/on_boarding_screen.dart';
import 'data/model/cache_user_repo.dart';
import 'data/model/news_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


const String kOnboardingKey = "onboarding";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NewsModelAdapter());
  await Hive.openBox<NewsModel>("bookmarks");
  final user = await CacheUserRepo.getUser();
  final bool onboarding = await CacheUserRepo.getBool(kOnboardingKey) ?? false;
  runApp(Newst(isUserLoggedIn: user != null, onboarding: onboarding));
}

class Newst extends StatelessWidget {
  final bool isUserLoggedIn;
  final bool onboarding;

  const Newst({
    super.key,
    required this.isUserLoggedIn,
    required this.onboarding,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Newst",
        home: isUserLoggedIn
            ? HomeScreen()
            : onboarding
            ? LoginScreen()
            : OnBoardingScreen(),
      ),
    );
  }
}
