import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mfswd62b_cpd/models/asset.dart';
import 'package:mfswd62b_cpd/widgets/asset_button.dart';
import '../mappers/asset_type_to_icon_mapper.dart';
import '../providers/asset_state_notifier.dart';
import '../screens/view_asset_screen.dart';

class AssetCardWidget extends ConsumerWidget {
  final Asset assetToDisplay;

  const AssetCardWidget({required this.assetToDisplay, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                padding: const EdgeInsets.only(bottom: 8),
                child: Wrap(
                  alignment: WrapAlignment.end,
                  spacing: 8,
                  children: [
                    AssetButton(iconData: Icons.view_agenda, backgroundColour: Colors.blueAccent, foregroundColour: Colors.white, buttonText: 'View', callback: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return ViewAssetScreen(assetToDisplay: assetToDisplay);
                      }));
                    }),
                    AssetButton(iconData: Icons.person_pin_circle, backgroundColour: Colors.orangeAccent, foregroundColour: Colors.white, buttonText: 'Update', callback: () {}),
                    AssetButton(iconData: Icons.delete, backgroundColour: Colors.redAccent, foregroundColour: Colors.white, buttonText: 'Delete', callback: () {
                      ref.read(assetProvider.notifier).deleteAsset(assetToDisplay);
                    }),
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