import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/cityToCity/cityToCityBloc/ctc_bloc.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/cityToCity/cityToCityBloc/ctc_states.dart';

class CityToCity extends StatelessWidget {
  const CityToCity({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CityToCityManager, CityToCityStates>(
        listener: (context, state) {},
        builder: (context, state) {
          CityToCityManager manager = CityToCityManager.get(context);
          return GestureDetector(
            onTap: () => manager.cTcController.isPanelOpen
                ? manager.cTcController.close()
                : null,
            child: Scaffold(
              body: manager.screens[manager.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                items: manager.navBarItems,
                currentIndex: manager.currentIndex,
                onTap: (index) => manager.changeIndex(index),
              ),
            ),
          );
        });
  }
}
