import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/cityLayout/cityBloc/city_bloc.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/cityLayout/cityBloc/city_states.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../shared/styles/colors.dart';
import 'city_map_widgets.dart';

class CityMap extends StatelessWidget {
  const CityMap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CityMapManager(),
      child: BlocConsumer<CityMapManager, CityMapStates>(
          listener: (context, state) {},
          builder: (context, state) {
            CityMapManager manager = CityMapManager.get(context);
            return SlidingUpPanel(
              controller: manager.panelController,
              color: IRideColors.panelColor,
              body: const IRideMaps(),
              maxHeight: 400.0,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20.0),
              ),
              panelBuilder: (controller) => const IRideSlidingPanel(),
            );
          }),
    );
  }
}
