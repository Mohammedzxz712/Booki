import 'package:bookly/features/login/data/models/login_request_body.dart';
import 'package:bookly/features/login/domain/repository/login_base_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/error/failure.dart';
  import '../entity/login_request_entity.dart';
import '../entity/login_response_entity.dart';

class LoginUseCase {
  final LoginBaseRepo repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, LoginResponseEntity>> login(LoginRequestEntity loginRequestBody) async {
    return await repository.login(loginRequestBody
    );
  }
}