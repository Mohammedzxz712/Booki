import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/di/dependency_injection.dart';
import '../../data/models/login_request_body.dart';
import '../../domain/usecases/login_usecase.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {

  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super( LoginInitial());

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginState() async {
    emit(LoginLoading());
    final response =await loginUseCase.login(
       LoginRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text,
      ),
    );
    response.fold(
          (l){ emit(LoginError(l.message));},
          (r) => emit(LoginSuccess(r)),
    );
  }


}