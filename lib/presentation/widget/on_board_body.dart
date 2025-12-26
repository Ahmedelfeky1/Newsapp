import 'package:flutter/cupertino.dart';

class OnBoardBody extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const OnBoardBody({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(image)),
          SizedBox(height: 15),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontFamily: "Times",
              color: Color(0xff4E4B66),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Times",
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff6E7191),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
