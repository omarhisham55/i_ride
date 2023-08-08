import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/services/servicesBloc/services_states.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../../shared/network/local/shared_prefs.dart';

class ServiceManager extends Cubit<ServiceStates> {
  ServiceManager() : super(InitialServiceState());
  static ServiceManager get(context) => BlocProvider.of(context);

  PanelController controller = PanelController();
  String? serviceDetail = SharedPrefs.getData(key: "ServiceRole");

  setServiceData(String role) {
    SharedPrefs.setData(key: "ServiceRole", value: role).then(
      (value) {
        serviceDetail = SharedPrefs.getData(key: "ServiceRole");
        print(serviceDetail);
        emit(SpecifyServiceState());
      },
    );
  }

  bool isSelected = false;

  setTabBarScreen(int index) {
    index == 1 ? isSelected = true : isSelected = false;
    emit(SetTabBarScreenState());
  }
}
