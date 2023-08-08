import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/services/service_widgets.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/services/servicesBloc/services_bloc.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/services/servicesBloc/services_states.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceManager, ServiceStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: ServiceManager.get(context).serviceDetail != null,
          builder: (context) => RoleServiceSpecified(role: ServiceManager.get(context).serviceDetail!),
          fallback: (context) => const NoRoleService(),
        );
      },
    );
  }
}
