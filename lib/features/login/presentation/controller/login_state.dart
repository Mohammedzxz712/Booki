import '../../domain/entity/login_response_entity.dart';

abstract class LoginState  {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {
   LoginResponseEntity loginResponseEntity;
  LoginSuccess(this.loginResponseEntity);
}
class LoginError extends LoginState {
  final String error;
  LoginError(this.error);
}