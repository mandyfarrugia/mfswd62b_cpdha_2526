import 'package:flutter/material.dart';
import 'package:mfswd62b_cpd/widgets/asset_management_navigation_menu_drawer.dart';

class AssetManagementHomeScreen extends StatelessWidget {
  const AssetManagementHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AssetManagementNavigationMenuDrawer(),
      appBar: AppBar(
        title: Text('Asset Management'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {}
          ),
        ],
      ),
      body: Center(child: Text('Welcome to Asset Management!')),
    );
  }
}