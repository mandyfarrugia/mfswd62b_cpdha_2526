import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mfswd62b_cpd/main.dart';
import 'package:mfswd62b_cpd/providers/asset_state_notifier.dart';
import 'package:mfswd62b_cpd/widgets/asset_list_render.dart';
import 'package:mfswd62b_cpd/widgets/asset_management_individual.dart';
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
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AssetManagementAddScreen()));
            }
          ),
        ]
      ),
      body: AssetListRender()
    );
  }
}