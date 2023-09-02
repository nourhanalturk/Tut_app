import 'package:dartz/dartz.dart';
import 'package:tut_app/data/data_source/remote_data_source.dart';
import 'package:tut_app/data/mapper/mapper.dart';
import 'package:tut_app/data/network/failure.dart';
import 'package:tut_app/data/network/requestes.dart';
import 'package:tut_app/domain/model/models.dart';
import 'package:tut_app/domain/repository/repository.dart';

import '../network/network_info.dart';

class RepositoryImpl implements Repository{
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(this._networkInfo,this._remoteDataSource);

  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async{
    if(await _networkInfo.isConnected){
      //its connected to internet ,its safe to call API
      final response = await  _remoteDataSource.login(loginRequest);
      if(response.status ==0){
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      }else{
        //failure business error
        //return either left
        return Left(Failure(409,response.message ?? "business error message"));
      }
    }
    else{
      //return internet connection error
      return Left(Failure(501,"Please check your internet connection"));

    }
  }

}