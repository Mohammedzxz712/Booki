import 'package:json_annotation/json_annotation.dart';
import '../../domain/entity/login_response_entity.dart';

part 'login_response_body.g.dart';

@JsonSerializable()
class LoginResponseBody extends LoginResponseEntity {
  @JsonKey(name: 'data')
  final UserData? userData;

  const LoginResponseBody({
    bool? status,
    int? code,
    String? message,
    this.userData,
  }) : super(
    status: status,
    code: code,
    message: message,
    user: userData,
  );

  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);
}

@JsonSerializable()
class UserData extends UserEntity {
  @JsonKey(name: 'username')
  final String? userNameFromJson;

  const UserData({
    String? token,
    this.userNameFromJson,
  }) : super(
    token: token,
    userName: userNameFromJson,
  );

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
