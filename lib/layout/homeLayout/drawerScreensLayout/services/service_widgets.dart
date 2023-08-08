import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/services/servicesBloc/services_bloc.dart';
import 'package:i_ride/layout/homeLayout/drawerScreensLayout/services/servicesBloc/services_states.dart';
import 'package:i_ride/shared/components/widgets.dart';
import 'package:i_ride/shared/network/local/shared_prefs.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/images.dart';

Widget serviceCard({
  required BuildContext context,
  required String title,
  required String body,
  required String image,
  required Function() onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: IRideColors.darkColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                    Text(
                      body,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: IRideColors.lightGreyColor),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: Image.asset(image)),
          ],
        ),
      ),
    );

class NoRoleService extends StatelessWidget {
  const NoRoleService({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 30.0,
      ),
      child: Column(
        children: [
          Text(
            "Who are you looking for?",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 30.0),
          serviceCard(
            context: context,
            title: "Search for specialists",
            body: "I'd like to order a service",
            image: IRideImages.sfs,
            onTap: () {
              ServiceManager.get(context).setServiceData("Specialist");
            },
          ),
          const SizedBox(height: 10.0),
          serviceCard(
            context: context,
            title: "Search for clients",
            body: "I'd like to get orders",
            image: IRideImages.sfc,
            onTap: () {
              ServiceManager.get(context).setServiceData("Client");
            },
          ),
        ],
      ),
    );
  }
}

class RoleServiceSpecified extends StatefulWidget {
  final String role;
  const RoleServiceSpecified({super.key, required this.role});

  @override
  State<RoleServiceSpecified> createState() => _RoleServiceSpecifiedState();
}

class _RoleServiceSpecifiedState extends State<RoleServiceSpecified>
    with TickerProviderStateMixin {
  late TabController controller;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        controller: ServiceManager.get(context).controller,
        color: IRideColors.panelColor,
        body: TabBarView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: widget.role == 'Client'
              ? clientTabBarItems()
              : specialistTabBarItems(),
        ),
        minHeight: 0.0,
        maxHeight: 200.0,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
        panelBuilder: (scrollController) => const ServicePanelBuilder(),
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        labelColor: Colors.blue,
        unselectedLabelColor: Colors.white,
        indicator: const UnderlineTabIndicator(borderSide: BorderSide.none),
        onTap: (value) => ServiceManager.get(context).setTabBarScreen(value),
        tabs: widget.role == 'Client' ? clientTabs() : specialistTabs(),
      ),
    );
  }

  List<Widget> clientTabs() => [
        Tab(
          text: "Services",
          icon: Icon(
            Icons.search,
            color: ServiceManager.get(context).isSelected
                ? Colors.white
                : Colors.blue,
          ),
        ),
        Tab(
          text: "My requests",
          icon: Icon(
            Icons.done_all_outlined,
            color: ServiceManager.get(context).isSelected
                ? Colors.blue
                : Colors.white,
          ),
        ),
      ];
  List<Widget> specialistTabs() => [
        Tab(
          text: "Feed",
          icon: Icon(
            Icons.feed_outlined,
            color: ServiceManager.get(context).isSelected
                ? Colors.white
                : Colors.blue,
          ),
        ),
        Tab(
          text: "My offers",
          icon: Icon(
            Icons.done_all_outlined,
            color: ServiceManager.get(context).isSelected
                ? Colors.blue
                : Colors.white,
          ),
        ),
      ];

  List<Widget> clientTabBarItems() => [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IRideFormFeild(
                  title: "How to help?",
                  titleStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  hintText: "Service or specialist",
                  textVerticalAlign: TextAlignVertical.center,
                  prefix: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  controller: searchController,
                ),
                const SizedBox(height: 10.0),
                Wrap(
                  children: List.generate(5, (index) => suggestedItem()),
                ),
                const CategorySection(),
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "No requests",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ];
  List<Widget> specialistTabBarItems() => [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) => specialistCard(),
              ),
            ),
            Container(
              color: IRideColors.darkColor,
              // margin: const EdgeInsets.only(bottom: 70.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Sign up to respond to orders",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IRideButton(
                      buttonText: "SIGNUP",
                      onPressed: () =>
                          SharedPrefs.removeData(key: "ServiceRole"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "No offers",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ];

  Widget specialistCard() => Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: IRideColors.lightDarkColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'price',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 24.0),
                ),
                Text(
                  'title',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'description',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: IRideColors.lightGreyColor),
                ),
                Text(
                  'date',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'date of post',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: IRideColors.lightGreyColor),
                ),
              ],
            ),
          ),
        ),
      );

  Widget suggestedItem() => Padding(
        padding: const EdgeInsets.only(right: 5.0, bottom: 5.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'other house keeping',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.black),
            ),
          ),
        ),
      );
}

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Categories",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Container(
          decoration: BoxDecoration(
            color: IRideColors.darkColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) => rowItem(
              context,
              'Popular',
              '1382 spaces',
              () {},
            ),
          ),
        ),
      ],
    );
  }
}

Widget rowItem(context, title, subtitle, onTap) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            const Icon(Icons.star_border),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: IRideColors.lightGreyColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );

class ServicePanelBuilder extends StatelessWidget {
  const ServicePanelBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceManager, ServiceStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Column(
              children: [
                Text(
                  "Choose your role",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    rowItem(
                      context,
                      "Customer",
                      "Search specialists for your tasks",
                      () {
                        ServiceManager.get(context).setServiceData("Client");
                        ServiceManager.get(context).controller.close();
                      },
                    ),
                    if (ServiceManager.get(context).serviceDetail == "Client")
                      const Icon(Icons.done),
                  ],
                ),
                Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    rowItem(
                      context,
                      "Specialist",
                      "Search and complete the suitable orders for you",
                      () {
                        ServiceManager.get(context)
                            .setServiceData("Specialist");
                        ServiceManager.get(context).controller.close();
                      },
                    ),
                    if (ServiceManager.get(context).serviceDetail ==
                        "Specialist")
                      const Icon(Icons.done),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
