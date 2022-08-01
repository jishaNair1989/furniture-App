import 'package:flutter/material.dart';

Widget cardDetails(String title,String imgPath,String value)
{
  return Material(
    elevation: 4.0,
    borderRadius: BorderRadius.circular(7.0),
    child: Container(
      height: 125,
      width: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.0,),
          Padding(padding:EdgeInsets.only(left:15.0 ),
            child: Image.asset(imgPath,
              fit: BoxFit.cover,
              height: 50.0,
              width: 50.0,
            ),
          ),
          SizedBox(height: 2.0,),
          Padding(padding: EdgeInsets.only(left: 15.0),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'googlefonts.lavo',
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 3.0,),
          Padding(padding: EdgeInsets.only(left: 15.0),
            child: Text(value,
              style: TextStyle(fontFamily: 'googlefonts.lavo',
                fontSize: 15.0,
                color: Colors.red,
                fontWeight: FontWeight.bold,),
            ),
          ),
        ],
      ),
    ),
  );
}