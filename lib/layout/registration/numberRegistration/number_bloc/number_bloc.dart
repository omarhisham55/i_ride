import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_ride/layout/registration/numberRegistration/number_bloc/number_states.dart';
import 'package:i_ride/shared/components/constants.dart';
import 'package:i_ride/shared/components/widgets.dart';
import 'package:i_ride/shared/styles/colors.dart';

class NumberManager extends Cubit<NumberStates> {
  NumberManager() : super(InitialNumberState());

  static NumberManager get(context) => BlocProvider.of(context);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> numberKey = GlobalKey<FormState>();
  TextEditingController numberController = TextEditingController();
}

class IRideBottomSheet extends StatefulWidget {
  const IRideBottomSheet({super.key});

  @override
  State<IRideBottomSheet> createState() => _IRideBottomSheetState();
}

class _IRideBottomSheetState extends State<IRideBottomSheet> {
  TextEditingController countryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Choose your location",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => popBack(context),
                child: const CircleAvatar(
                  backgroundColor: IRideColors.lightDarkColor,
                  child: Icon(
                    Icons.close,
                  ),
                ),
              )
            ],
          ),
          IRideFormFeild(
            title: "",
            hintText: "Search for a country or region",
            backgroundColor: IRideColors.lightDarkColor,
            controller: countryController,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) => countryItem(),
            itemCount: 10,
          ),
        ],
      ),
    );
  }

  Widget countryItem() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            const Icon(Icons.flag),
            const SizedBox(width: 10.0),
            Text(
              "country name (+02)",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      );
}
