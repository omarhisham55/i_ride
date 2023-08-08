import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_ride/layout/registration/signIn/sign_in_bloc/sign_in_states.dart';
import 'package:i_ride/shared/network/local/shared_prefs.dart';

import '../../../../shared/components/constants.dart';
import '../../../homeLayout/home.dart';

class SignInManager extends Cubit<SignInStates> {
  SignInManager() : super(InitialSignInState());
  static SignInManager get(context) => BlocProvider.of<SignInManager>(context);

  GlobalKey<FormState> signInKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
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

  signIn(context) {
    if (signInKey.currentState!.validate()) {
      if (rememberMe) {
        SharedPrefs.setData(key: "saveLogin", value: true).then((value) => pushPage(context, const Home()));
      } else {
        SharedPrefs.setData(key: "saveLogin", value: false).then((value) => pushPage(context, const Home()));
      }
    }
  }
}
