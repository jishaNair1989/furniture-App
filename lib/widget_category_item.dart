import 'package:flutter/material.dart';

Widget category(String imgPath, String title)
{
  return Builder(
    builder: (context) {
      return SizedBox(
        height: 75.0,
        width: MediaQuery.of(context).size.width / 4.0,
        child: Column(
          children: [
            Container(
              height: 50.0,
              decoration:  BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgPath),
                ),
              ),
            ),
            Text(
              title,
              style: const TextStyle(fontFamily: 'GoogleFonts.Lat'),
            ),
          ],
        ),
      );
    }
  );
}