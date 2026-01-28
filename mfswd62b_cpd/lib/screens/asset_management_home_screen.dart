import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mfswd62b_cpd/widgets/asset_list_render.dart';
import 'package:mfswd62b_cpd/widgets/asset_management_app_bar.dart';
import 'package:mfswd62b_cpd/widgets/asset_management_navigation_menu_drawer.dart';

class AssetManagementHomeScreen extends ConsumerWidget {
  const AssetManagementHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      drawer: const AssetManagementNavigationMenuDrawer(),
      appBar: const AssetManagementAppBar(title: 'Asset Management System'),
      body: AssetListRender()
    );
  }
}