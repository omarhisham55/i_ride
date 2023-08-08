import 'package:flutter/material.dart';
import 'package:i_ride/layout/welcomeBoard/board_widget.dart';
import 'package:i_ride/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeBoard extends StatefulWidget {
  const WelcomeBoard({super.key});

  @override
  State<WelcomeBoard> createState() => _WelcomeBoardState();
}

class _WelcomeBoardState extends State<WelcomeBoard> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: 5,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: BuildPageViewItem(controller: controller, index: index),
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: 5,
            onDotClicked: (index) => controller.jumpToPage(index),
            effect: const JumpingDotEffect(
              activeDotColor: IRideColors.primaryColor,
              dotColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
