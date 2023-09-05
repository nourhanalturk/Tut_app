
import 'package:tut_app/data/network/requestes.dart';
import 'package:tut_app/data/response/response.dart';

import '../network/app_api.dart';
// it used to call the app service client
abstract class RemoteDataSource {
 Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl implements  RemoteDataSource{

  final AppServiceClient _appServiceClient ;
  RemoteDataSourceImpl(this._appServiceClient);
  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async{
   return await _appServiceClient.login(loginRequest.email, loginRequest.password);
  }
  
}