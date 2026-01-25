import 'package:flutter/material.dart';
import 'package:mfswd62b_cpd/widgets/asset_management_individual.dart';
import 'package:mfswd62b_cpd/widgets/asset_management_navigation_menu_drawer.dart';

import '../models/asset.dart';
import '../models/asset_type.dart';
import 'asset_management_add_screen.dart';

class AssetManagementHomeScreen extends StatelessWidget {
  final List<Asset> assets = [
    Asset(
      name: 'Xiaomi POCO C65',
      serialNumber: '51162/64W802797',
      description: 'POCO C65 comes with a choice of 6GB and 8GB configurations, with 8GB version expandable up to 16GB RAM thanks to memory extension technology',
      assetTypeIndex: 1
    ),
    Asset(
      name: 'ASUS TUF Gaming FX505DU',
      serialNumber: 'L3NRCV00H74111F',
      description: 'ASUS TUF Gaming FX505 will change the way you look at gaming laptops. It exceeds expectations, boasting impressive hardware and a compact, aggressively-designed chassis that’s exceptionally tough. FX505 has a gaming desktop-inspired keyboard with RGB-backlit keys, a highlighted WASD key group, and Overstroke technology for fast and precise control. With a cutting-edge IPS-level NanoEdge display, and a MIL-STD-810G test certified durability, FX505 delivers an immersive gaming experience without breaking the bank!',
      assetTypeIndex: 2
    )
  ];

  AssetManagementHomeScreen({super.key});

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
        ],
      ),
      body: ListView.builder(
        itemCount: assets.length,
        itemBuilder: (context, index) {
          return AssetManagementIndividual(assetToDisplay: assets[index]);
        }
      )
    );
  }
}