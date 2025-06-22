import 'package:bookly/features/login/domain/entity/login_request_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody extends LoginRequestEntity{

  const LoginRequestBody({
    required super.email,
    required super.password,
  });
  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}
