import 'package:flutter/material.dart';
import 'package:mfswd62b_cpd/widgets/asset_card_button.dart';
import 'package:mfswd62b_cpd/widgets/asset_management_navigation_menu_drawer.dart';

import '../models/asset_type.dart';

class AssetManagementAddScreen extends StatefulWidget {
  const AssetManagementAddScreen({super.key});

  @override
  State<AssetManagementAddScreen> createState() {
    return _AssetManagementAddScreenState();
  }
}

class _AssetManagementAddScreenState extends State<AssetManagementAddScreen> {
  final TextEditingController _assetNameController = TextEditingController();
  final TextEditingController _serialNumberController = TextEditingController();
  AssetType _selectedAssetType = AssetType.other;

  @override
  void dispose() {
    this._assetNameController.dispose();
    this._serialNumberController.dispose();
    super.dispose();
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
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: _assetNameController,
                    decoration: const InputDecoration(
                      labelText: 'Asset Name'
                    ),
                  )
                )
              ],
            ),
            const SizedBox(width: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                  keyboardType: TextInputType.text,
                  controller: _serialNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Serial Number'
                  ),
                ))
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'Description'
                    ),
                  )
                )
              ]
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                DropdownButton(
                  value: this._selectedAssetType,
                  items: AssetType.values.map((assetType) =>
                    DropdownMenuItem(
                      value: assetType,
                      child: Text(assetType.name)
                    )
                  ).toList(),
                  onChanged: (value) {
                    if(value == null) return;
                    setState(() {
                      this._selectedAssetType = value;
                    });
                  },
                )
              ],
            ),
            const SizedBox(width: 12),
            Row(children: [
                AssetCardButton(
                  backgroundColour: Colors.deepPurpleAccent,
                  foregroundColour: Colors.white,
                  buttonText: 'Add new asset',
                  callback: () {}
                )
              ],
            )
          ],
        )
      )
    );
  }
}