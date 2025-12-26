import 'package:flutter/material.dart';
class CustomRowData extends StatelessWidget {
  const CustomRowData({
    super.key,
    required this.text,
    required this.textButton,
    required this.screenName,
  });

  final String text;
  final Widget screenName;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontFamily: "Times",
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => screenName),
            );
          },
          child: Text(
            textButton,
            style: TextStyle(
              color: Color(0xffC53030),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: "Times",
            ),
          ),
        ),
      ],
    );
  }
}
