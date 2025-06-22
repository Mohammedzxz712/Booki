import 'package:equatable/equatable.dart';

class LoginResponseEntity extends Equatable {
  final bool? status;
  final int? code;
  final String? message;
  final UserEntity? user;

  const LoginResponseEntity({
    this.status,
    this.code,
    this.message,
    this.user,
  });

  @override

  List<Object?> get props =>
      [status, code, message, user];
}

class UserEntity extends Equatable {
  final String? token;
  final String? userName;

  const UserEntity({
    this.token,
    this.userName,
  });

  @override
  List<Object?> get props => [token, userName];
}
