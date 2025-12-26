import 'package:flutter/material.dart';
class CustomElvatBt extends StatelessWidget {
  const CustomElvatBt({super.key, required this.text, required this.onPressed, this.width=double.infinity});

  final String text;
  final Function() onPressed;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, 50),
        backgroundColor: Color(0xffC53030),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          fontFamily: "Times",
          color: Color(0xffFFFCFC),
        ),
      ),
    );
  }
}
