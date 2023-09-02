// repository implementation in the domain layer because the domain layer only can connect with presentation
import 'package:tut_app/data/network/requestes.dart';
import 'package:dartz/dartz.dart';
import 'package:tut_app/domain/model/models.dart';

import '../../data/network/failure.dart';

abstract class Repository {
 Future<Either<Failure ,Authentication>> login(LoginRequest loginRequest);
}