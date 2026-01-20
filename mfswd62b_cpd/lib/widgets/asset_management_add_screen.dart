import 'package:flutter/material.dart';
import 'package:mfswd62b_cpd/widgets/asset_management_navigation_menu_drawer.dart';

class AssetManagementAddScreen extends StatelessWidget {
  const AssetManagementAddScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                label: Text('Asset Name')
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                label: Text('Serial Number')
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                label: Text('Description')
              ),
            )
          ],
        )
      )
    );
  }
}