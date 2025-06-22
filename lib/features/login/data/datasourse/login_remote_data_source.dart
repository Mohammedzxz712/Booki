

import 'package:bookly/features/login/data/models/login_request_body.dart';
import 'package:bookly/features/login/data/models/login_response_body.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/network/error/exception.dart';
import '../../../../core/network/error_message_model.dart';

abstract class LoginBaseRemoteDataSource {
  Future<LoginResponseBody> login(LoginRequestBody loginRequestBody);
}

class LoginRemoteDataSource implements LoginBaseRemoteDataSource {
  final FirebaseAuth _auth;

  LoginRemoteDataSource(this._auth);

  @override
  Future<LoginResponseBody> login(LoginRequestBody loginRequestBody) async {
    final response = await _auth.signInWithEmailAndPassword(
      email: loginRequestBody.email,
      password: loginRequestBody.password,
    );
    if (response.user != null) {
      print('------------------------------------------Login successful: ${response.user?.email}');
      return LoginResponseBody(
       userData: UserData(
         userNameFromJson: response.user?.displayName,
         token: response.user?.uid,
       ),
        message: 'Login successful',
        status: true,
        code: 200,

      );

    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(const {
          'message': 'Login failed',
          'status': false,
          'code': 401,
        }),
      );
    }
  }
}
