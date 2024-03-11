import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors{
  static const Color bgColor = Color(0xff101010);
  static const Color secondaryColor = Color(0xff202023);
  static const Color mGreyClor = Color(0xff9E9E9E);

}

 TextStyle mTextStyle16({Color mColor = Colors.black, FontWeight mfontWeight = FontWeight.normal}){
  return TextStyle(
  fontSize: 16,
  fontFamily: 'mainFont',
  color:mColor,
      fontWeight: mfontWeight
  );

}

TextStyle mTextStyle25({Color mColor = Colors.black, FontWeight mfontWeight = FontWeight.normal}){
  return TextStyle(
      fontSize: 25,
      fontFamily: 'mainFont',
      color:mColor,
      fontWeight: mfontWeight
  );

}

TextStyle mTextStyle12({Color mColor = Colors.black, FontWeight mfontWeight = FontWeight.normal}){
  return TextStyle(
      fontSize: 12,
      fontFamily: 'mainFont',
      color:mColor,
      fontWeight: mfontWeight
  );

}