import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/cityToCity/cityToCityBloc/ctc_bloc.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/cityToCity/cityToCityBloc/ctc_states.dart';
import 'package:i_ride/layout/homeLayout/homeBloc/home_states.dart';
import 'package:i_ride/shared/styles/images.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../../../../../shared/components/widgets.dart';
import '../../../../../../shared/styles/colors.dart';
import '../../../../homeBloc/home_cubit.dart';
import '../../../cityLayout/city_map_widgets.dart';

class NewRide extends StatelessWidget {
  const NewRide({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeManager, HomeStates>(
        listener: (context, homeState) {},
        builder: (context, homeState) {
          HomeManager manager = HomeManager.get(context);
          return BlocConsumer<CityToCityManager, CityToCityStates>(
              listener: (context, state) {},
              builder: (context, ctcState) {
                return SlidingUpPanel(
                  controller: CityToCityManager.get(context).cTcController,
                  minHeight: 0.0,
                  maxHeight: 470.0,
                  color: IRideColors.panelColor,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20.0)),
                  panelBuilder: (scrollController) => const CTCPanel(),
                  body: Scaffold(
                    body: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 100.0,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: IRideRidingTypes.rt.length,
                                itemBuilder: (context, index) =>
                                    buildBookingHeaderCard(
                                  image: IRideRidingTypes.rt[index],
                                  context: context,
                                  index: index,
                                  selectedIndex: manager.ridingTypeIndex,
                                  onTap: () =>
                                      manager.changeRidingType(index).then(
                                            (value) =>
                                                CityToCityManager.get(context)
                                                    .ridingTypeCTCAction(
                                                        context, value),
                                          ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            buildBookingCityToCityPrivateRideBody(context),
                            const SizedBox(height: 20.0),
                            IRideButton(
                              buttonText: "Find a driver",
                              onPressed: () {},
                            ),
                            const SizedBox(height: 170.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        });
  }

  Widget buildBookingCityToCityPrivateRideBody(context) {
    TextEditingController fromController = TextEditingController();
    TextEditingController toController = TextEditingController();

    return Column(
      children: [
        IRideFormFeild(
          title: "From",
          hintText: "From",
          controller: fromController,
          textVerticalAlign: TextAlignVertical.center,
          suffix: const Icon(
            Icons.chevron_right,
            color: Colors.white,
          ),
        ),
        IRideFormFeild(
          title: "To",
          hintText: "To",
          controller: toController,
          textVerticalAlign: TextAlignVertical.center,
          suffix: const Icon(
            Icons.chevron_right,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: SizedBox(
            height: 100.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: IRideRidingTypes.rtctc.length,
              itemBuilder: (context, index) => buildBookingHeaderCard(
                image: IRideRidingTypes.rtctc[index],
                context: context,
                index: index,
                selectedIndex: HomeManager.get(context).ridingTypeCTCIndex,
                onTap: () =>
                    HomeManager.get(context).changeRidingCTCType(index),
              ),
            ),
          ),
        ),
        newRideCTC(context),
      ],
    );
  }

  Widget newRideCTC(context) {
    TextEditingController whenController = TextEditingController();
    TextEditingController nOfPassengersController = TextEditingController();
    TextEditingController fairController = TextEditingController();
    TextEditingController commentsController = TextEditingController();
    return Column(
      children: [
        IRideFormFeild(
          title: "When",
          hintText: "When",
          controller: whenController,
          textVerticalAlign: TextAlignVertical.center,
          suffix: const Icon(
            Icons.chevron_right,
            color: Colors.white,
          ),
        ),
        if (HomeManager.get(context).ridingTypeCTCIndex != 2)
          IRideFormFeild(
            title: HomeManager.get(context).ridingTypeCTCIndex == 0
                ? "Number of passengers"
                : "Number of seats",
            hintText: HomeManager.get(context).ridingTypeCTCIndex == 0
                ? "Number of passengers"
                : "Number of seats",
            controller: nOfPassengersController,
            textVerticalAlign: TextAlignVertical.center,
            suffix: const Icon(
              Icons.chevron_right,
              color: Colors.white,
            ),
          ),
        IRideFormFeild(
          title: "Offer your fair",
          hintText: "Offer your fair",
          controller: fairController,
          textVerticalAlign: TextAlignVertical.center,
          suffix: const Icon(
            Icons.chevron_right,
            color: Colors.white,
          ),
        ),
        if (HomeManager.get(context).ridingTypeCTCIndex != 2)
          IRideFormFeild(
            title: "Comments",
            hintText: "Comments",
            controller: commentsController,
            textVerticalAlign: TextAlignVertical.center,
            suffix: const Icon(
              Icons.chevron_right,
              color: Colors.white,
            ),
          ),
        if (HomeManager.get(context).ridingTypeCTCIndex == 2)
          IRideFormFeild(
            title: "Describe your parcel",
            hintText: "Describe your parcel",
            controller: commentsController,
            textVerticalAlign: TextAlignVertical.center,
            suffix: const Icon(
              Icons.chevron_right,
              color: Colors.white,
            ),
          ),
      ],
    );
  }
}

class CTCPanel extends StatelessWidget {
  const CTCPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            IRideRidingTypes.miniMapImage,
            width: 60.0,
          ),
          Text(
            "City to city",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            "Comfortable rides to another cities at your price: \n- Ride to other cities and surrounding areas.\n-Offer your fair and choose your driver.\n- Set your date and time -- no need to rely on bus timetables.\n-aget a door-to-door service: ride right from your doorstep to your exact destination.\n- Reserve all seats for a private ride or share the trip with other passengers and pay only for your seat.",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 10.0),
          IRideButton(
            buttonText: "Close",
            buttonColor: IRideColors.lightDarkColor,
            onPressed: () =>
                CityToCityManager.get(context).cTcController.close(),
          ),
        ],
      ),
    );
  }
}
