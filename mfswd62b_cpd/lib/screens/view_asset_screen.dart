import 'package:flutter/material.dart';
import 'package:mfswd62b_cpd/screens/asset_management_add_screen.dart';
import 'package:mfswd62b_cpd/screens/asset_management_home_screen.dart';
import 'package:mfswd62b_cpd/widgets/asset_button.dart';
import '../models/asset.dart';
import '../widgets/asset_management_navigation_menu_drawer.dart';
import '../widgets/advanced_asset_card_widget.dart';

class ViewAssetScreen extends StatelessWidget {
  final Asset assetToDisplay;

  const ViewAssetScreen({required this.assetToDisplay, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AssetManagementNavigationMenuDrawer(),
      appBar: AppBar(
        title: Text(assetToDisplay.name),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AssetManagementAddScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Row(
              children: [
                AssetButton(
                  iconData: Icons.arrow_back_outlined,
                  backgroundColour: Colors.blueAccent,
                  foregroundColour: Colors.white,
                  buttonText: 'Back to all assets',
                  callback: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return AssetManagementHomeScreen();
                    }));
                  },
                ),
              ],
            ),
            AdvancedAssetCardWidget(assetToDisplay: assetToDisplay),
          ],
        ),
      ),
    );
  }
}
