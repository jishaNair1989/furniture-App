import 'package:flutter/material.dart';

alertDialog(BuildContext context,String msg){
  ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.redAccent,
      content: Text(msg),
    ),
  );
}