import 'package:flutter/material.dart';
import '../mappers/asset_type_to_icon_mapper.dart';
import '../models/asset.dart';
import './asset_card_button.dart';

class AdvancedAssetCardWidget extends StatelessWidget {
  final Asset assetToDisplay;

  const AdvancedAssetCardWidget({ required this.assetToDisplay, super.key});

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
                subtitle: Text(assetToDisplay.serialNumber)
              ),
              Divider(thickness: .25),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(assetToDisplay.dateCreatedAt.toLocal().toString())
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(assetToDisplay.description)
                      ],
                    ),
                    const SizedBox(height: 8)
                  ],
                ),
              ),
              Divider(thickness: .25),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Wrap(
                  alignment: WrapAlignment.end,
                  spacing: 8,
                  children: [
                    //AssetCardButton(backgroundColour: Colors.blueAccent, foregroundColour: Colors.white, buttonText: 'Go back to all assets', callback: () {}),
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