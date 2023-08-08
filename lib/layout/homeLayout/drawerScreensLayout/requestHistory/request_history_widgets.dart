import 'package:flutter/material.dart';
import 'package:i_ride/shared/components/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../shared/styles/colors.dart';

Widget buildRequestHistoryItem({
  required BuildContext context,
  required PanelController controller,
}) =>
    InkWell(
      onTap: () =>
          controller.isPanelClosed ? controller.open() : controller.close(),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "date",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: IRideColors.lightGreyColor, fontSize: 18.0),
                  ),
                  Text(
                    "From",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    "To",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    "Fair",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Completed".toUpperCase(),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

class RequestHistoryPanel extends StatelessWidget {
  final PanelController controller;
  const RequestHistoryPanel({super.key, required this.controller});
  static final List<List> buttonText = [
    ["Ride details", IRideColors.primaryColor, Colors.black],
    ["Repeat request", IRideColors.primaryColor, Colors.black],
    ["Return route", IRideColors.primaryColor, Colors.black],
    ["Delete ride request", IRideColors.lightDarkColor, Colors.red],
    ["Close", IRideColors.lightDarkColor, Colors.white],
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 20.0,
      ),
      itemBuilder: (context, index) => IRideButton(
        buttonText: buttonText[index][0],
        buttonTextColor: buttonText[index][2],
        buttonColor: buttonText[index][1],
        onPressed: () {},
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 10.0),
      itemCount: buttonText.length,
    );
  }
}
