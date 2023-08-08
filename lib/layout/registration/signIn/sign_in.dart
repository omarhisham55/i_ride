import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_ride/layout/registration/signIn/sign_in_bloc/sign_in_bloc.dart';
import 'package:i_ride/layout/registration/signIn/sign_in_bloc/sign_in_states.dart';
import 'package:i_ride/layout/registration/signUp/sign_up.dart';
import 'package:i_ride/shared/components/widgets.dart';
import 'package:i_ride/shared/styles/images.dart';

import '../../../shared/components/constants.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInManager(),
      child: BlocConsumer<SignInManager, SignInStates>(
          listener: (context, state) {},
          builder: (context, state) {
            SignInManager manager = SignInManager.get(context);
            return Scaffold(
              body: Form(
                key: manager.signInKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(IRideImages.title),
                      Text(
                        "Welcome to IRide",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Column(
                        children: [
                          IRideFormFeild(
                            title: "username",
                            hintText: "Enter email or username",
                            controller: manager.userController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Username or Email is required";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20.0),
                          IRideFormFeild(
                            title: "password",
                            hintText: "Enter your password",
                            controller: manager.passwordController,
                            textVerticalAlign: TextAlignVertical.center,
                            isPassword: manager.isVisible,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password is required";
                              } else if (value.length < 4) {
                                return "Invalid password length (more than 4 characters)";
                              }
                              return null;
                            },
                            suffix: IconButton(
                              onPressed: () => manager.changePassword(),
                              icon: Icon(
                                manager.passwordIcon,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () => manager.setRememberMe(),
                                child: Text(
                                  "Remember me",
                                  style:
                                      TextStyle(color: manager.rememberMeColor),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Forgot password",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IRideButton(
                            buttonText: "Sign In",
                            onPressed: () => manager.signIn(context),
                          ),
                          const SizedBox(height: 10.0),
                          textSpanSecondButton(
                            context: context,
                            firstText: "Don't have an account ? ",
                            secondText: "Sign up",
                            onPressed: () => pushPage(context, const SignUp()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
