import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mfswd62b_cpd/providers/battery_service_provider.dart';
import 'package:mfswd62b_cpd/widgets/asset_list_render.dart';
import 'package:mfswd62b_cpd/widgets/asset_management_navigation_menu_drawer.dart';
import 'asset_management_add_screen.dart';

class AssetManagementHomeScreen extends ConsumerWidget {
  const AssetManagementHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      drawer: const AssetManagementNavigationMenuDrawer(),
      appBar: AppBar(
        title: Text('Asset Management'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final batteryService = ref.read(batteryServiceProvider);
              final batteryLevel = await batteryService.getBatteryLevel();

              if(batteryLevel < 20) {
                return;
              }

              if(context.mounted) {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AssetManagementAddScreen()));
              }
            }
          ),
        ]
      ),
      body: AssetListRender()
    );
  }
}