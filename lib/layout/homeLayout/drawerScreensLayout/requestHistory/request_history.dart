import 'package:flutter/material.dart';
import 'package:i_ride/shared/styles/colors.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'request_history_widgets.dart';

class RequestHistory extends StatelessWidget {
  const RequestHistory({super.key});

  @override
  Widget build(BuildContext context) {
    PanelController requestHistoryPanelController = PanelController();
    return SlidingUpPanel(
      controller: requestHistoryPanelController,
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(
          color: IRideColors.lightGreyColor,
        ),
        itemBuilder: (context, index) => buildRequestHistoryItem(
          context: context,
          controller: requestHistoryPanelController,
        ),
      ),
      minHeight: 0.0,
      maxHeight: 350.0,
      color: IRideColors.panelColor,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
      panelBuilder: (controller) =>
          RequestHistoryPanel(controller: requestHistoryPanelController),
    );
  }
}
