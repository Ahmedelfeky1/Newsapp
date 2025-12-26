import 'package:flutter/material.dart';

class CustomNewsCard extends StatelessWidget {
  final String title;
  final String source;
  final String time;
  final String image;

  const CustomNewsCard({
    super.key,
    required this.title,
    required this.image,
    required this.source,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 235,
      height: 140,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                color: Color(0xffFFFCFC),
                fontFamily: "Times",
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                SizedBox(width: 8),
                Text(
                  source,
                  style: TextStyle(
                    color: Color(0xffFFFCFC),
                    fontSize: 12,
                    fontFamily: "Times",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 4,),
                Expanded(
                  child: Text(
                    time,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Color(0xffFFFCFC),
                      fontSize: 10,
                      fontFamily: "Times",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
