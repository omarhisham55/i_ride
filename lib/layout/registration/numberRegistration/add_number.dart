import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_ride/layout/registration/numberRegistration/number_bloc/number_bloc.dart';
import 'package:i_ride/layout/registration/numberRegistration/number_bloc/number_states.dart';
import 'package:i_ride/layout/registration/signIn/sign_in.dart';
import 'package:i_ride/shared/components/widgets.dart';
import '../../../shared/components/constants.dart';

class AddPhoneNumber extends StatefulWidget {
  const AddPhoneNumber({super.key});

  @override
  State<AddPhoneNumber> createState() => _AddPhoneNumberState();
}

class _AddPhoneNumberState extends State<AddPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NumberManager(),
      child: BlocConsumer<NumberManager, NumberStates>(
          listener: (context, state) {},
          builder: (context, state) {
            NumberManager manager = NumberManager.get(context);
            return Scaffold(
              key: manager.scaffoldKey,
              body: Form(
                key: manager.numberKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Join us via phone number",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      "Join us via phone number",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: IRideFormFeild(
                        title: "",
                        hintText: "",
                        controller: manager.numberController,
                        type: TextInputType.number,
                        textVerticalAlign: TextAlignVertical.center,
                        validator: (value) {
                          bool valid = isNumeric(value!);
                          if (value.length < 6) {
                            return "Invalid Number";
                          } else if (!valid) {
                            return "Invalid Number";
                          }
                          return null;
                        },
                        prefix: GestureDetector(
                          onTap: () =>
                              manager.scaffoldKey.currentState!.showBottomSheet(
                            (context) => const IRideBottomSheet(),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.flag,
                                size: 30.0,
                              ),
                              Icon(Icons.keyboard_arrow_down_rounded),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: IRideButton(
                        buttonText: "Next",
                        buttonTextColor: Colors.black,
                        onPressed: () {
                          if (manager.numberKey.currentState!.validate()) {
                            pushPage(context, const SignIn());
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    textSpanSecondButton(
                      context: context,
                      firstText: "Joining our app means you agree with our",
                      secondText: "Terms and Conditions",
                      onPressed: () {},
                    ),
                    textSpanSecondButton(
                      context: context,
                      firstText: "and",
                      secondText: "Privacy Policy",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
