import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mfswd62b_cpd/screens/asset_management_add_screen.dart';
import '../providers/battery_service_provider.dart';
import '../screens/asset_management_home_screen.dart';
import '../services/firebase_analytics_service.dart';
import '../services/notification_service.dart';

class AssetManagementNavigationMenuDrawer extends ConsumerWidget {
  const AssetManagementNavigationMenuDrawer({super.key});

  Future<void> disableAccessToAddFunctionalityIfBatteryIsLow(BuildContext context, WidgetRef ref) async {
    final batteryService = ref.read(batteryServiceProvider);
    final batteryLevel = await batteryService.getBatteryLevel();

    if(batteryLevel < 20) {
      await NotificationService.showNotification(title: 'Battery is low!', body: 'New assets cannot be added to the system until battery level reaches at least 20%.');
      await FirebaseAnalyticsService.logLowBatteryBlocked();
      return;
    }

    if(context.mounted) {
      Navigator.pop(context);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AssetManagementAddScreen()));
    }
  }
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            addSpacingAtTheTop(context),
            constructNavigationMenuItems(context, ref)
          ]
        )
      )
    );
  }

  Widget addSpacingAtTheTop(BuildContext context) {
    return Container(
      //Add padding at the top so the first navigation menu item does not overlap with the notch.
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top
      )
    );
  }

  Widget constructNavigationMenuItems(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AssetManagementHomeScreen()));
            }
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Add new asset'),
            onTap: () async {
              await this.disableAccessToAddFunctionalityIfBatteryIsLow(context, ref);
            },
          )
        ]
      ),
    );
  }
}