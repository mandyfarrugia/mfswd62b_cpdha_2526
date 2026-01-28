import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mfswd62b_cpd/services/firebase_analytics_service.dart';

import '../providers/battery_service_provider.dart';
import '../screens/asset_management_add_screen.dart';
import '../services/notification_service.dart';

class AssetManagementAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;

  const AssetManagementAppBar({ required this.title, super.key });

  Future<void> disableAccessToAddFunctionalityIfBatteryIsLow(BuildContext context, WidgetRef ref) async {
    final batteryService = ref.read(batteryServiceProvider);
    final batteryLevel = await batteryService.getBatteryLevel();

    if(batteryLevel < 20) {
      await NotificationService.showNotification(title: 'Battery is low!', body: 'New assets cannot be added to the system until battery level reaches at least 20%.');
      return;
    }

    if(context.mounted) {
      Navigator.pop(context);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AssetManagementAddScreen()));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
        title: Text(title),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              await this.disableAccessToAddFunctionalityIfBatteryIsLow(context, ref);
              await FirebaseAnalyticsService.logLowBatteryBlocked();
            }
          ),
        ]
      );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}