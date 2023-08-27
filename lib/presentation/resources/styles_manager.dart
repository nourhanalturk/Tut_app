import 'package:flutter/material.dart';
import 'font_manager.dart';

TextStyle _textStyle (FontWeight fontWeight ,double fontSize ,Color color ,){
  return TextStyle(
    fontWeight: fontWeight,
    color: color,
    fontSize: fontSize,
    fontFamily: FontConstants.fontFamily
  );
}

TextStyle getRegularStyle ({double fontSize = FontSizeManager.s12,required Color color}){
  return _textStyle(FontWeightManager.regular, fontSize, color);
}

TextStyle getMediumStyle ({double fontSize = FontSizeManager.s12,required Color color}){
  return _textStyle(FontWeightManager.medium, fontSize, color);
}

TextStyle getLightStyle ({double fontSize = FontSizeManager.s14,required Color color}){
  return _textStyle(FontWeightManager.light, fontSize, color);
}

TextStyle getBoldStyle ({double fontSize = FontSizeManager.s14,required Color color}){
  return _textStyle(FontWeightManager.bold, fontSize, color);
}


TextStyle getSemiBoldStyle ({double fontSize = FontSizeManager.s14,required Color color}){
  return _textStyle(FontWeightManager.semiBold, fontSize, color);
}