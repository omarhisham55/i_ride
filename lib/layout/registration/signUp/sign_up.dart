import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_ride/shared/components/widgets.dart';
import 'package:i_ride/shared/styles/images.dart';
import '../../../shared/components/constants.dart';
import 'sign_up_bloc/sign_up_bloc.dart';
import 'sign_up_bloc/sign_up_states.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpManager(),
      child: BlocConsumer<SignUpManager, SignUpStates>(
          listener: (context, state) {},
          builder: (context, state) {
            SignUpManager manager = SignUpManager.get(context);
            return Scaffold(
              body: Form(
                key: manager.signUpKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(IRideImages.title),
                      Text(
                        "Sign up",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Column(
                        children: [
                          IRideFormFeild(
                            title: "username",
                            hintText: "Enter your username",
                            controller: manager.nameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Username is required";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20.0),
                          IRideFormFeild(
                            title: "Email",
                            hintText: "Enter your email",
                            controller: manager.emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email is required";
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
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IRideButton(
                            buttonText: "Sign In",
                            onPressed: () => manager.signUp(),
                          ),
                          const SizedBox(height: 10.0),
                          textSpanSecondButton(
                            context: context,
                            firstText: "Don't have an account ? ",
                            secondText: "Sign up",
                            onPressed: () => popBack(context),
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
