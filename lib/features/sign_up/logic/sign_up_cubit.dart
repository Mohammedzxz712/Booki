import 'package:bloc/bloc.dart';
import 'package:bookly/features/sign_up/logic/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());


  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
  TextEditingController();
   bool? isChecked;
  final formKey = GlobalKey<FormState>();

  void termsAndConditionsChecked(value) {
    isChecked = value??false;
    emit(TermsAndConditionsChecked());
  }
}
