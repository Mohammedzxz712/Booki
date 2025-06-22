
import 'package:bookly/features/login/data/datasourse/login_remote_data_source.dart';
import 'package:bookly/features/login/domain/repository/login_base_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/error/exception.dart';
import '../../../../core/network/error/failure.dart';
import '../../domain/entity/login_request_entity.dart';
import '../../domain/entity/login_response_entity.dart';
import '../models/login_request_body.dart';

class LoginRepository extends LoginBaseRepo {

  final LoginBaseRemoteDataSource loginBaseRemoteDataSource;

  LoginRepository(this.loginBaseRemoteDataSource);

  @override
  Future<Either<Failure, LoginResponseEntity>> login(
      LoginRequestEntity loginRequestBody) async {
    try {
      final response = await loginBaseRemoteDataSource.login(
        LoginRequestBody(
          email: loginRequestBody.email,
          password: loginRequestBody.password,
        ),
      );
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

}