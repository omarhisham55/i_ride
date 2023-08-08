import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/cityToCity/cityToCityBloc/ctc_bloc.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/cityToCity/cityToCityBloc/ctc_states.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/services/servicesBloc/services_states.dart';
import 'package:i_ride/layout/homeLayout/homeBloc/home_cubit.dart';
import 'package:i_ride/layout/homeLayout/homeBloc/home_states.dart';
import 'package:i_ride/shared/components/widgets.dart';
import 'package:i_ride/shared/styles/colors.dart';

import 'drawerScreensLayout/services/servicesBloc/services_bloc.dart';

class IRideDrawer extends StatelessWidget {
  const IRideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeManager, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Drawer(
            backgroundColor: IRideColors.panelColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      const CircleAvatar(radius: 25.0),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Omar',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 20.0,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      size: 18,
                                    ),
                                    itemCount: 5,
                                  ),
                                ),
                                Text(
                                  ' 5',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: IRideColors.primaryColor,
                                      ),
                                ),
                                Text(
                                  ' (97)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: IRideColors.primaryColor,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: HomeManager.get(context).drawerData.length,
                    itemBuilder: (context, index) => buildDrawerRowItem(
                      context,
                      HomeManager.get(context).drawerData[index][0],
                      HomeManager.get(context).drawerData[index][1],
                      index,
                    ),
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.grey[600],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      IRideButton(
                        buttonText: "Driver mode",
                        buttonTextColor: Colors.black,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 20.0),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            foregroundImage:
                                AssetImage("assets/images/social/facebook.png"),
                          ),
                          SizedBox(width: 20.0),
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            foregroundImage: AssetImage(
                                "assets/images/social/instagram.png"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget buildDrawerRowItem(
    BuildContext context,
    String title,
    IconData icon,
    int index,
  ) =>
      Container(
        color: HomeManager.get(context).drawerIndex == index
            ? IRideColors.lightDarkColor
            : null,
        child: InkWell(
          onTap: () => HomeManager.get(context).selectDrawerRow(index),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 15.0,
            ),
            child: Row(
              children: [
                Icon(icon),
                const SizedBox(width: 10.0),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ),
      );
}

Widget serviceTitle(BuildContext context) =>
    BlocConsumer<ServiceManager, ServiceStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: ServiceManager.get(context).serviceDetail != null,
          builder: (context) => InkWell(
            onTap: () => ServiceManager.get(context).controller.isPanelClosed
                ? ServiceManager.get(context).controller.open()
                : ServiceManager.get(context).controller.close(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.person_4_outlined,
                  color: Colors.white,
                ),
                const SizedBox(width: 10.0),
                Text(
                  ServiceManager.get(context).serviceDetail!,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(width: 10.0),
                const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          fallback: null,
        );
      },
    );

Widget cityToCityTitle(context) =>
    BlocConsumer<CityToCityManager, CityToCityStates>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (CityToCityManager.get(context).currentIndex) {
          case 0:
            return const Text(
              "City to City",
              style: TextStyle(fontSize: 20.0),
            );
          case 1:
            return const Text(
              "Rideshare",
              style: TextStyle(fontSize: 20.0),
            );
          case 2:
            return const Text(
              "My orders",
              style: TextStyle(fontSize: 20.0),
            );
          default:
            return Container();
        }
      },
    );

PreferredSizeWidget cityToCityBottom(context) => PreferredSize(
      preferredSize: const Size.fromHeight(60.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: MaterialButton(
              onPressed: () => CityToCityManager.get(context).isRideSearch
                  ? CityToCityManager.get(context).shareBottomToggle()
                  : null,
              color: !CityToCityManager.get(context).isRideSearch
                  ? Colors.white
                  : IRideColors.panelColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Text(
                "Ride search",
                style: TextStyle(
                  color: !CityToCityManager.get(context).isRideSearch
                      ? Colors.black
                      : Colors.white,
                ),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () => !CityToCityManager.get(context).isRideSearch
                ? CityToCityManager.get(context).shareBottomToggle()
                : null,
            color: CityToCityManager.get(context).isRideSearch
                ? Colors.white
                : IRideColors.panelColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Text(
              "Requests ${CityToCityManager.get(context).requests.toString()}",
              style: TextStyle(
                color: CityToCityManager.get(context).isRideSearch
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
