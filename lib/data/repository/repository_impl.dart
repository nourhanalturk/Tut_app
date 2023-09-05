import 'package:dartz/dartz.dart';
import 'package:tut_app/data/data_source/remote_data_source.dart';
import 'package:tut_app/data/mapper/mapper.dart';
import 'package:tut_app/data/network/error_handler.dart';
import 'package:tut_app/data/network/failure.dart';
import 'package:tut_app/data/network/requestes.dart';
import 'package:tut_app/domain/model/models.dart';
import 'package:tut_app/domain/repository/repository.dart';

import '../network/network_info.dart';

class RepositoryImpl implements Repository{
  final RemoteDataSource _remoteDataSource ;
  final NetworkInfo _networkInfo;
  RepositoryImpl(this._networkInfo,this._remoteDataSource);

  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async{
    if(await _networkInfo.isConnected){
      //its connected to internet ,its safe to call API

      try{
        final response = await  _remoteDataSource.login(loginRequest);

        if(response.status ==ApiInternalStatus.SUCCESS){
          //success
          //return either right
          //return data
          return Right(response.toDomain());
        }else{
          //failure business error
          //return either left
          return Left(Failure(ApiInternalStatus.FAILURE,response.message ?? ResponseMessage.DEFAULT));
        }
      }catch(error){
       return Left(ErrorHandler.handler(error).failure);
      }

    }
    else{
      //return internet connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());

    }
  }

}