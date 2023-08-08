import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/cityLayout/city_map.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/cityToCity/city_to_city.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/freight/freight.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/requestHistory/request_history.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/services/services.dart';
import 'home_states.dart';

class HomeManager extends Cubit<HomeStates> {
  HomeManager() : super(InitialHomeState());

  static HomeManager get(context) => BlocProvider.of(context);

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  //drawer
  final List drawerData = [
    ['City', Icons.time_to_leave_outlined],
    ['Request history', Icons.access_time],
    ['Services', Icons.miscellaneous_services_rounded],
    ['City to City', Icons.language_outlined],
    ['Freight', Icons.fire_truck_outlined],
    ['Safety', Icons.safety_check_outlined],
    ['Settings', Icons.settings_outlined],
    ['FAQ', Icons.info_outline],
    ['Support', Icons.comment_outlined],
  ];
  int drawerIndex = 0;
  selectDrawerRow(int index) {
    drawerIndex = index;
    scaffoldKey.currentState!.closeDrawer();
    if (index == 3) {
      ridingTypeIndex = 3;
    }
    emit(SelectDrawerState());
  }

  resetToHome() {
    drawerIndex = 0;
    emit(SelectDrawerState());
  }

  gotoIndex(int index) {
    drawerIndex = index;
    emit(SelectDrawerState());
  }

  late List<Widget> drawerScreens = const [
    CityMap(),
    RequestHistory(),
    Services(),
    CityToCity(),
    Freight(),
  ];

  //handle riding types
  int ridingTypeIndex = 0;
  int ridingTypeCTCIndex = 0;

  Future<int> changeRidingType(int index) async {
    ridingTypeIndex = index;
    emit(ChangeRidingTypeState());
    return ridingTypeIndex;
  }

  Future<int> changeRidingCTCType(int index) async {
    ridingTypeCTCIndex = index;
    emit(ChangeRidingTypeState());
    return ridingTypeCTCIndex;
  }
}
