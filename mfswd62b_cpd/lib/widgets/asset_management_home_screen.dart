import 'package:flutter/material.dart';
import 'package:mfswd62b_cpd/main.dart';
import 'package:mfswd62b_cpd/widgets/asset_management_individual.dart';
import 'package:mfswd62b_cpd/widgets/asset_management_navigation_menu_drawer.dart';

import '../models/asset.dart';
import '../models/asset_type.dart';
import 'asset_management_add_screen.dart';

class AssetManagementHomeScreen extends StatefulWidget {
  const AssetManagementHomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AssetManagementHomeScreenState();
  }
}

class _AssetManagementHomeScreenState extends State<AssetManagementHomeScreen> {
  late List<Asset> assets;
  
  @override
  void initState() {
    super.initState();
    assets = objectBoxStoreService.assetBox.getAll();
  }

  @override
  Widget build(BuildContext context) {
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
      body: ListView.builder(
        itemCount: assets.length,
        itemBuilder: (context, index) {
          return AssetManagementIndividual(
            assetToDisplay: assets[index],
          );
        },
      ),
    );
  }
}