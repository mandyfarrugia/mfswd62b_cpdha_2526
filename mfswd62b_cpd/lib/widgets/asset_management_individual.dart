import 'package:flutter/material.dart';
import 'package:mfswd62b_cpd/mappers/asset_type_to_icon_mapper.dart';
import 'package:mfswd62b_cpd/models/asset.dart';

class AssetManagementIndividual extends StatelessWidget {
  final Asset assetToDisplay;

  const AssetManagementIndividual({required this.assetToDisplay, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(AssetTypeToIconMapper.assetTypeToIconMap[assetToDisplay.assetType]),
            title: Text(assetToDisplay.name),
            subtitle: Text(assetToDisplay.getAssetTypeName()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white
                ),
                child: const Text('View'),
                onPressed: () {},
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 238, 134, 49),
                  foregroundColor: Colors.white
                ),
                child: const Text('Update'),
                onPressed: () {},
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 241, 25, 25),
                  foregroundColor: Colors.white
                ),
                child: const Text('Delete'),
                onPressed: () {},
              )
            ],
          )
        ],
      )
    ));
  }
}