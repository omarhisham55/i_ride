import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/cityToCity/cityToCityBloc/ctc_bloc.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/services/servicesBloc/services_bloc.dart';
import 'package:i_ride/layout/homeLayout/homeBloc/home_cubit.dart';
import 'package:i_ride/layout/registration/numberRegistration/add_number.dart';
import 'package:i_ride/layout/welcomeBoard/board.dart';
import 'package:i_ride/shared/bloc_observer.dart';
import 'package:i_ride/shared/network/local/shared_prefs.dart';
import 'package:i_ride/shared/styles/theme.dart';

import 'layout/homeLayout/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedPrefs.init();
  Widget? startWidget;
  bool boardingDone = SharedPrefs.getData(key: "boarding") ?? false;
  bool isLoginDone = SharedPrefs.getData(key: "saveLogin") ?? false;
  boardingDone
      ? isLoginDone
          ? startWidget = const Home()
          : startWidget = const AddPhoneNumber()
      : startWidget = const WelcomeBoard();
  runApp(MyApp(startWidget: startWidget));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  const MyApp({super.key, this.startWidget});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeManager()),
          BlocProvider(create: (context) => ServiceManager()),
          BlocProvider(create: (context) => CityToCityManager()),
        ],
        child: MaterialApp(
          title: 'IRide',
          theme: IRideTheme.iRideTheme,
          debugShowCheckedModeBanner: false,
          home: startWidget,
        ),
      ),
    );
  }
}
