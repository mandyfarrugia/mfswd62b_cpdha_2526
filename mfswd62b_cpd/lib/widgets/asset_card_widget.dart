import 'package:flutter/material.dart';
import 'package:mfswd62b_cpd/mappers/asset_type_to_icon_mapper.dart';
import 'package:mfswd62b_cpd/models/asset.dart';
import 'package:mfswd62b_cpd/widgets/asset_card_button.dart';

import '../screens/view_asset_screen.dart';

class AssetCardWidget extends StatelessWidget {
  final Asset assetToDisplay;

  const AssetCardWidget({required this.assetToDisplay, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(AssetTypeToIconMapper.assetTypeToIconMap[assetToDisplay.assetType]),
                title: Text(assetToDisplay.name),
                subtitle: Text(assetToDisplay.serialNumber),
                trailing: Text(assetToDisplay.assetLocation.target?.latitude.toString() ?? "No location provided!")
              ),
              Divider(thickness: .25),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Wrap(
                  alignment: WrapAlignment.end,
                  spacing: 8,
                  children: [
                    AssetCardButton(backgroundColour: Colors.blueAccent, foregroundColour: Colors.white, buttonText: 'View', callback: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return ViewAssetScreen(assetToDisplay: assetToDisplay);
                      }));
                    }),
                    AssetCardButton(backgroundColour: Colors.orangeAccent, foregroundColour: Colors.white, buttonText: 'Update', callback: () {}),
                    AssetCardButton(backgroundColour: Colors.redAccent, foregroundColour: Colors.white, buttonText: 'Delete', callback: () {}),
                  ],
                )
              )
            ],
          )
        )
      )
    );
  }
}