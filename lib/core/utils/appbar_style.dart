import 'package:flutter/material.dart';

AppBar buildAppBar(String title,{Color backgroundColor=Colors.green}){
  return AppBar(
    backgroundColor: backgroundColor,
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
    ),
  );
}