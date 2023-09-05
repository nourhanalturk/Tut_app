import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tut_app/app/app_prefs.dart';
import 'package:tut_app/app/constants.dart';

const String APPLICATION_JSON="application/json";
const String CONTENT_TYPE="content_type";
const String ACCEPT="accept";
const String AUTHORIZATION="authorization";
const String DEFAULT_LANGUAGE="language";



class DioFactory {
  AppPreferences _appPreferences ;
  DioFactory(this._appPreferences);
  Future<Dio> getDio ()async{
    
    String language =await _appPreferences.getAppLanguage();
    Dio dio = Dio();

    Map<String,String> headers = {
      CONTENT_TYPE:APPLICATION_JSON,
      ACCEPT:APPLICATION_JSON,
      AUTHORIZATION:Constants.token,
      DEFAULT_LANGUAGE:language,

    };
    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
      receiveTimeout: const Duration(milliseconds: Constants.apiTimeOut),
      sendTimeout: const Duration(milliseconds: Constants.apiTimeOut),

    );
   if(!kReleaseMode){ // its debug mode so print app logs
     dio.interceptors.add(PrettyDioLogger(
       requestHeader: true,
       requestBody: true,
       responseBody: true,
       error: true
     ));
   }

    return dio;
  }

}