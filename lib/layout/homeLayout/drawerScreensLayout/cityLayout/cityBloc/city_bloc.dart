import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/cityLayout/cityBloc/city_states.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CityMapManager extends Cubit<CityMapStates> {
  CityMapManager() : super(InitialCityMapState());

  static CityMapManager get(context) => BlocProvider.of(context);

  //set map
  var markers = HashSet<Marker>();

  setMapMarkers() {
    markers.add(
      const Marker(
        markerId: MarkerId('1'),
        position: LatLng(31.21966931084816, 29.94165211934725),
      ),
    );
    emit(SetMarkersState());
  }

  Set<Circle> circles = {
    Circle(
      circleId: const CircleId('1'),
      center: const LatLng(31.21966931084816, 29.94165211934725),
      radius: 1000,
      strokeWidth: 0,
      fillColor: Colors.lightBlue.withOpacity(.5),
    ),
  };

  //booking slidingPanel
  PanelController panelController = PanelController();
  TextEditingController pickUpLocation = TextEditingController();
  TextEditingController destinationLocation = TextEditingController();
  TextEditingController fare = TextEditingController();
  TextEditingController comments = TextEditingController();

  hideSlidingPanel() {
    panelController.close();
    emit(SlidingPanelState());
  }

  showSlidingPanel() {
    panelController.open();
    emit(SlidingPanelState());
  }
}
