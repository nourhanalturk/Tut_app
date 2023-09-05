import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tut_app/presentation/forgot_password/forgot_password_view.dart';
import 'package:tut_app/presentation/login/view/login_view.dart';
import 'package:tut_app/presentation/onboarding/view/onboarding_view.dart';
import 'package:tut_app/presentation/register/register_view.dart';
import 'package:tut_app/presentation/resources/strings_manager.dart';
import 'package:tut_app/presentation/splash/splash_view.dart';
import 'package:tut_app/presentation/store_details/store_details_view.dart';

import '../../app/di.dart';

class Routs{

  static const String splashRout ="/";
  static const String loginRout ="/login";
  static const String registerRout ="/register";
  static const String onBoardingRout ="/onBoarding";
  static const String forgotPasswordRout ="/forgotPassword";
  static const String mainRout ="/main";
  static const String storeDetailsRout ="/storeDetails";
}

class RoutGenerator {

  static Route<dynamic> getRout (RouteSettings routeSettings){
    switch (routeSettings.name){
      case Routs.splashRout:
        return MaterialPageRoute(builder: (_) => const SplashView(),);
      case Routs.loginRout:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView(),);
      case Routs.onBoardingRout:
        return MaterialPageRoute(builder: (_) => const OnBoardingView(),);
      case Routs.forgotPasswordRout:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView(),);
      case Routs.registerRout:
        return MaterialPageRoute(builder: (_) => const RegisterView(),);
      case Routs.storeDetailsRout:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView(),);
      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (context) => Scaffold(
      appBar: AppBar(title: const Text(AppStrings.noRoutFound),),
      body:const Center(child: Text(AppStrings.noRoutFound)),
    ),);
  }
}