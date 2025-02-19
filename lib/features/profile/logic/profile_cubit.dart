import 'dart:io';
import 'package:bookly/features/profile/logic/profile_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart'; // <-- Add this import

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController locationController =
  TextEditingController();
  bool? isChecked;

  void termsAndConditionsChecked(value) {
    isChecked = value??false;
    emit(TermsAndConditionsChecked());
  }


  final formKey = GlobalKey<FormState>();

  static ProfileCubit get(context) => BlocProvider.of(context);

  File? profilePhoto;
  final picker = ImagePicker();

  Future<void> getProfileImage() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        profilePhoto = File(pickedFile.path);
        emit(CameraSuccessState());
      } else {
        emit(CameraFailureState());
      }
    } catch (e) {
      emit(CameraFailureState());
    }
  }
}
