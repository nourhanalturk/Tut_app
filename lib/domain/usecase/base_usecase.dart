//usecase is like a gate that the presentation layer can be able to contact with the domain layer then to data layer
import 'package:dartz/dartz.dart';
import 'package:tut_app/data/network/failure.dart';

abstract class BaseUseCase<In,Out>{ //In from view model in presentation layer , Out is the response from data to domain to view model
  Future<Either<Failure,Out>> execute (In input);
}