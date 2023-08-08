import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/cityToCity/cityToCityBloc/ctc_bloc.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/cityToCity/cityToCityBloc/ctc_states.dart';
import 'package:i_ride/shared/components/widgets.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CityToCityManager, CityToCityStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return const EmptyOrders();
        });
  }
}

class EmptyOrders extends StatelessWidget {
  const EmptyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You don't have any orders yet",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 10.0),
          IRideButton(
            buttonText: "Create a requesr",
            onPressed: () => CityToCityManager.get(context).goToNew(),
          ),
        ],
      ),
    );
  }
}
