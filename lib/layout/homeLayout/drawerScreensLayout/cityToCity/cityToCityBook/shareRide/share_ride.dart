import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/cityToCity/cityToCityBloc/ctc_bloc.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/cityToCity/cityToCityBloc/ctc_states.dart';
import 'package:i_ride/shared/components/widgets.dart';
import 'package:i_ride/shared/styles/colors.dart';
import 'package:i_ride/shared/styles/images.dart';

class ShareRide extends StatelessWidget {
  const ShareRide({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CityToCityManager, CityToCityStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return CityToCityManager.get(context).isRideSearch
            ? buildRequests(context)
            : buildRideSearch();
      },
    );
  }

  Widget buildRideSearch() {
    TextEditingController fromController = TextEditingController();
    TextEditingController toController = TextEditingController();
    TextEditingController whenController = TextEditingController();
    TextEditingController nOfSeatsController = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                IRideFormFeild(
                  title: "From",
                  hintText: "From",
                  controller: fromController,
                ),
                IRideFormFeild(
                  title: "To",
                  hintText: "To",
                  controller: toController,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: IRideFormFeild(
                        title: "When",
                        hintText: "When",
                        controller: whenController,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: IRideFormFeild(
                        title: "Seats",
                        hintText: "Seats",
                        controller: nOfSeatsController,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            color: IRideColors.panelColor,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) => shareRideCardItem(
                  context: context,
                  header: "Available 4 seats out of 4",
                  buttonText: "I want to join",
                  onButtonPress: () =>
                      CityToCityManager.get(context).getRequest()),
            ),
          ),
        ],
      ),
    );
  }

  Widget shareRideCardItem({
    required BuildContext context,
    required String header,
    required String buttonText,
    required Function() onButtonPress,
  }) =>
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: IRideColors.darkColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      header,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.blue),
                    ),
                  ),
                  Text(
                    header == "Sent" ? "date" : "",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "EGP275 ",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              "for 1 seat",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Image.asset(
                                IRideImages.location,
                                height: 100.0,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  locationCity(context, "ميامي",
                                      "Alexandria (الأسكندرية)"),
                                  locationCity(
                                      context, "المعادي", "Cairo (القاهرة)"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "13:30",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const CircleAvatar(),
                  const SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "car type",
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Wrap(
                        children: [
                          Text(
                            "driver name",
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const Icon(Icons.star, color: Colors.amber),
                          Text(
                            " 5.0 ",
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            "5 orders",
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: IRideColors.lightGreyColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              IRideButton(
                buttonText: buttonText,
                buttonTextColor: header == "Sent" ? Colors.white : Colors.black,
                buttonColor:
                    header == "Sent" ? IRideColors.lightDarkColor : null,
                textPadding: const EdgeInsets.symmetric(vertical: 0.0),
                onPressed: onButtonPress,
              ),
            ],
          ),
        ),
      );

  Widget locationCity(
    context,
    location,
    city,
  ) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            location,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            city,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: IRideColors.lightGreyColor),
          ),
        ],
      );

  Widget buildRequests(context) => CityToCityManager.get(context).requests == 0
      ? emptyRequests(context)
      : foundRequests(context);

  Widget emptyRequests(context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "The requests you've sent will appear here",
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.fade,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      );

  Widget foundRequests(context) => ListView.builder(
        itemCount: CityToCityManager.get(context).requests,
        itemBuilder: (context, index) => shareRideCardItem(
          context: context,
          header: "Sent",
          buttonText: "Cancel request",
          onButtonPress: () {
            CityToCityManager.get(context).removeRequest();
          },
        ),
      );
}
