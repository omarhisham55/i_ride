import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/cityToCity/cityToCityBloc/ctc_states.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/cityToCity/cityToCityBook/myOrders/my_orders.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/cityToCity/cityToCityBook/newRide/new_ride.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/cityToCity/cityToCityBook/shareRide/share_ride.dart';
import 'package:i_ride/layout/homeLayout/homeBloc/home_cubit.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CityToCityManager extends Cubit<CityToCityStates> {
  CityToCityManager() : super(InitialCityToCityState());
  static CityToCityManager get(context) => BlocProvider.of(context);

  List<Widget> screens = const [
    NewRide(),
    ShareRide(),
    MyOrders(),
  ];

  List<BottomNavigationBarItem> navBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.add_box_outlined),
      label: "New Ride",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add_box_outlined),
      label: "Ride share",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add_box_outlined),
      label: "My orders",
    ),
  ];

  int currentIndex = 0;
  changeIndex(int index) {
    currentIndex = index;
    emit(ChangeCityToCityIndexState());
  }

  goToNew() {
    currentIndex = 0;
    emit(ChangeCityToCityIndexState());
  }

  bool isRideSearch = false;
  shareBottomToggle() {
    isRideSearch = !isRideSearch;
    emit(BottomShareToggleState());
  }

  PanelController cTcController = PanelController();
  PanelController shareRideController = PanelController();

  ridingTypeCTCAction(BuildContext context, int value) {
    switch (value) {
      case 0:
      case 1:
      case 2:
      case 5:
        HomeManager.get(context).resetToHome();
        break;
      case 3:
        cTcController.isPanelClosed
            ? cTcController.open()
            : cTcController.close();
        break;
      case 6:
      case 8:
      case 9:
        HomeManager.get(context).gotoIndex(2);
        break;
      case 4:
      case 7:
        HomeManager.get(context).gotoIndex(4);
        break;
    }
  }

  int requests = 0;
  getRequest() {
    requests++;
    emit(UpdateRequestState());
  }

  removeRequest() {
    requests--;
    emit(UpdateRequestState());
  }
}
