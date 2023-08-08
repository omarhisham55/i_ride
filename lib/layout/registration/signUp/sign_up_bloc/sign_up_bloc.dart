import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_up_states.dart';

class SignUpManager extends Cubit<SignUpStates> {
  SignUpManager() : super(InitialSignUpState());
  static SignUpManager get(context) => BlocProvider.of<SignUpManager>(context);

  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isVisible = false;
  IconData passwordIcon = Icons.remove_red_eye;
  changePassword() {
    isVisible = !isVisible;
    isVisible
        ? passwordIcon = Icons.remove_red_eye_outlined
        : passwordIcon = Icons.remove_red_eye;
    emit(ChangePasswordState());
  }

  Color? rememberMeColor = Colors.white;
  bool rememberMe = false;
  setRememberMe() {
    rememberMe = !rememberMe;
    rememberMe ? rememberMeColor = null : rememberMeColor = Colors.white;
    emit(RememberMeState());
  }

  signUp(){
    if(signUpKey.currentState!.validate()){
      
    }
  }
}
