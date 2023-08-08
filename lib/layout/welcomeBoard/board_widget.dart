import 'package:flutter/material.dart';
import 'package:i_ride/layout/registration/signIn/sign_in.dart';
import 'package:i_ride/shared/components/constants.dart';
import 'package:i_ride/shared/network/local/shared_prefs.dart';
import 'package:i_ride/shared/styles/colors.dart';

import '../../shared/components/widgets.dart';
import '../../shared/styles/images.dart';

class BuildPageViewItem extends StatelessWidget {
  final PageController controller;
  final int index;
  const BuildPageViewItem(
      {super.key, required this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (index == 0) Image.asset(IRideImages.title),
        Image.asset(IRideImages.boarderImages[index]),
        if (index == 4) const SizedBox(height: 40.0),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            crossAxisAlignment: index == 0
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              Text(
                boardTitles[index],
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 20.0),
              Text(
                boardBody[index],
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: index == 0 ? TextAlign.start : TextAlign.center,
              ),
              const SizedBox(height: 40.0),
              if (index == 0)
                IRideButton(
                  buttonText: "Get Started",
                  buttonTextColor: Colors.black,
                  onPressed: () {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.linear,
                    );
                  },
                ),
              if (index == 4)
                GestureDetector(
                  onTap: () => SharedPrefs.setData(key: "boarding", value: true)
                      .then((value) => replacePage(context, const SignIn())),
                  child: const CircleAvatar(
                    radius: 30.0,
                    backgroundColor: IRideColors.primaryColor,
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
