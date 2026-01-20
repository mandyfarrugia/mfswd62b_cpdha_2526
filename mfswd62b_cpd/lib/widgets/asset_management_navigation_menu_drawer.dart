import 'package:flutter/material.dart';
import 'asset_management_home_screen.dart';

class AssetManagementNavigationMenuDrawer extends StatelessWidget {
  const AssetManagementNavigationMenuDrawer({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            addSpacingAtTheTop(context),
            constructNavigationMenuItems(context)
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

  Widget constructNavigationMenuItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AssetManagementHomeScreen()));
            }
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Add new asset'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AssetManagementHomeScreen()));
            },
          )
        ]
      ),
    );
  }
}