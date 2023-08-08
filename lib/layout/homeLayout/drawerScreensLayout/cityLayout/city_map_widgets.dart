import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/cityLayout/cityBloc/city_bloc.dart';
import 'package:i_ride/layout/homeLayout/homeBloc/home_cubit.dart';
import 'package:i_ride/layout/homeLayout/homeBloc/home_states.dart';

import '../../../../shared/components/widgets.dart';
import '../../../../shared/styles/images.dart';

class IRideMaps extends StatelessWidget {
  const IRideMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: LatLng(31.21966931084816, 29.94165211934725),
        zoom: 14.4746,
      ),
      onMapCreated: (controller) => CityMapManager.get(context).setMapMarkers(),
      onCameraMove: (position) =>
          CityMapManager.get(context).hideSlidingPanel(),
      onCameraIdle: () => CityMapManager.get(context).showSlidingPanel(),
      markers: CityMapManager.get(context).markers,
      circles: CityMapManager.get(context).circles,
    );
  }
}

class IRideSlidingPanel extends StatelessWidget {
  const IRideSlidingPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeManager, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 100.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: IRideRidingTypes.rt.length,
                    itemBuilder: (context, index) => buildBookingHeaderCard(
                      image: IRideRidingTypes.rt[index],
                      context: context,
                      index: index,
                      selectedIndex: HomeManager.get(context).ridingTypeIndex,
                      onTap: () =>
                          HomeManager.get(context).changeRidingType(index),
                    ),
                  ),
                ),
                buildBookingRideBody(context),
              ],
            ),
          );
        });
  }

  static const List<List> bookingBody = [
    ["Pick up location", Icons.location_on],
    ["Destination", Icons.my_location],
    ["Offer your fair", Icons.monetization_on_outlined],
    ["Comments", Icons.comment],
  ];

  Widget buildBookingRideBody(context) {
    CityMapManager manager = CityMapManager.get(context);
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(0.0),
          itemBuilder: (context, index) => IRideBookingFormFeild(
            title: "",
            hintText: bookingBody[index][0],
            controller: manager.pickUpLocation,
            textVerticalAlign: TextAlignVertical.center,
            prefix: Icon(
              bookingBody[index][1],
              color: Colors.white,
            ),
          ),
          itemCount: bookingBody.length,
        ),
        const SizedBox(height: 20.0),
        IRideButton(
          buttonText: "Find a Driver",
          onPressed: () {},
        ),
      ],
    );
  }
}

Widget buildBookingHeaderCard({
  required BuildContext context,
  required String image,
  required int index,
  required int selectedIndex,
  required Function() onTap,
}) =>
    BlocConsumer<HomeManager, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? Colors.blue.withOpacity(.7)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      image,
                      height: 60.0,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
