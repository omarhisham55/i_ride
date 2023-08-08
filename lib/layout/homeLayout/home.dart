import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/cityToCity/cityToCityBloc/ctc_bloc.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/cityToCity/cityToCityBloc/ctc_states.dart';
import 'package:i_ride/layout/homeLayout/homeBloc/home_cubit.dart';
import 'package:i_ride/layout/homeLayout/homeBloc/home_states.dart';
import 'package:i_ride/layout/homeLayout/home_widgets.dart';
import 'package:i_ride/shared/styles/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeManager, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeManager manager = HomeManager.get(context);
          return BlocConsumer<CityToCityManager, CityToCityStates>(
              listener: (context, ctcState) {},
              builder: (context, ctcState) {
                return WillPopScope(
                  onWillPop: () {
                    if (HomeManager.get(context).drawerIndex != 0) {
                      manager.resetToHome();
                      return Future.value(false);
                    }
                    return Future.value(true);
                  },
                  child: Scaffold(
                    key: manager.scaffoldKey,
                    backgroundColor: IRideColors.lightDarkColor,
                    drawer: const IRideDrawer(),
                    appBar: AppBar(
                      backgroundColor: manager.drawerIndex == 0
                          ? Colors.transparent
                          : IRideColors.lightDarkColor,
                      elevation: manager.drawerIndex == 0 ? 0.0 : 1.0,
                      title: HomeManager.get(context).drawerIndex == 2
                          ? serviceTitle(context)
                          : HomeManager.get(context).drawerIndex == 3
                              ? cityToCityTitle(context)
                              : null,
                      bottom: HomeManager.get(context).drawerIndex == 3 &&
                              CityToCityManager.get(context).currentIndex == 1
                          ? cityToCityBottom(context)
                          : null,
                      centerTitle: true,
                      leading: Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          top: 10.0,
                        ),
                        child: CircleAvatar(
                          backgroundColor: IRideColors.lightDarkColor,
                          child: IconButton(
                            onPressed: () =>
                                manager.scaffoldKey.currentState!.openDrawer(),
                            icon: const Icon(Icons.menu),
                          ),
                        ),
                      ),
                      actions: [
                        if (manager.drawerIndex == 0)
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 10.0, top: 10.0),
                            child: CircleAvatar(
                              radius: 25.0,
                              backgroundColor: IRideColors.lightDarkColor,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.share),
                              ),
                            ),
                          ),
                      ],
                    ),
                    extendBodyBehindAppBar:
                        manager.drawerIndex == 0 ? true : false,
                    body: manager.drawerScreens[manager.drawerIndex],
                  ),
                );
              });
        });
  }
}
