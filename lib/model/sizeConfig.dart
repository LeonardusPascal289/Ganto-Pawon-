import 'package:flutter/cupertino.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double width;
  static double height;
  static double sizeBlockWidth;
  static double sizeBlockHeight;

  void init (BuildContext context){

    _mediaQueryData = MediaQuery.maybeOf(context);
    width = _mediaQueryData.size.width;
    height = _mediaQueryData.size.height;
    sizeBlockWidth = width/100;
    sizeBlockHeight = height/100;
  }
}