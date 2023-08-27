import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/color_manager.dart';
import 'package:tut_app/presentation/resources/font_manager.dart';
import 'package:tut_app/presentation/resources/styles_manager.dart';
import 'package:tut_app/presentation/resources/values_manager.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    //main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1 ,
    splashColor: ColorManager.lightPrimary, //ripple effect color ,the color when pressed to a button for example
    //cardView Theme
    cardTheme: CardTheme(
      color:ColorManager.white,
      elevation:AppSize.s4,
      shadowColor:ColorManager.grey,
    ),

    //app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle: getRegularStyle(color: ColorManager.white,fontSize: FontSizeManager.s16) ,
    ),

    //button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary
    ),
      //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
       style: ElevatedButton.styleFrom(
         textStyle: getRegularStyle(color: ColorManager.white,fontSize: FontSizeManager.s17),
         primary: ColorManager.primary,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(AppSize.s12),
         )
       ),
  ),

    //text theme
    textTheme: TextTheme(
      headline1: getSemiBoldStyle(color: ColorManager.darkGrey,fontSize: FontSizeManager.s16),
      subtitle1: getMediumStyle(color:ColorManager.lightGrey,fontSize: FontSizeManager.s14),
      caption: getRegularStyle(color: ColorManager.grey1),
      bodyText1: getRegularStyle(color: ColorManager.grey),
      displayLarge: getLightStyle(color: ColorManager.lightGrey,fontSize: FontSizeManager.s18)
    ),

    //Input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      //content padding
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      //hint style
      hintStyle: getRegularStyle(color: ColorManager.grey,fontSize: FontSizeManager.s14),
      //label style
      labelStyle: getMediumStyle(color: ColorManager.grey,fontSize: FontSizeManager.s14),
      errorStyle: getRegularStyle(color: ColorManager.error,fontSize: FontSizeManager.s14),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary,width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
      ),
      focusedBorder:OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.grey,width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
      ),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.error,width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primary,width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
      ),


    ),

  );
}