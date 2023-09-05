
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tut_app/app/app_prefs.dart';
import 'package:tut_app/data/data_source/remote_data_source.dart';
import 'package:tut_app/data/network/app_api.dart';
import 'package:tut_app/data/network/dio_factory.dart';
import 'package:tut_app/data/network/network_info.dart';
import 'package:tut_app/data/repository/repository_impl.dart';
import 'package:tut_app/domain/usecase/login_usecase.dart';
import 'package:tut_app/presentation/login/view_modwl/login_view_model.dart';

import '../domain/repository/repository.dart';

final instance = GetIt.instance; // its like a map that have all the instance of the project classes

Future<void> initAppModule ()async{
  //app module , its a module where we put all the generic dependencies (generic means use in all the app)


  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  //we want to insert this instance to the instance var here (we have registerFactory =>when we call it a new instance will created   ,registerLazySingleton=>to init it when we use (for  memory) ,registerSingleton => it have the same instance only one we use it to generic classes)
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app pref instance
  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  //network info instance
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));

  //dio factory instance
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory>().getDio();
  // app service client
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  //remote data source
  instance.registerLazySingleton<RemoteDataSource> (() => RemoteDataSourceImpl(instance()));
  
  //repository 

  instance.registerLazySingleton<Repository> (()=> RepositoryImpl(instance(), instance()));


}

 initLoginModule () {
 if(!GetIt.I.isRegistered<LoginUseCase>()){
  instance.registerFactory<LoginUseCase>(() =>LoginUseCase(instance()) );
  instance.registerFactory<LoginViewModel>(() =>LoginViewModel(instance()) );
  }


}
