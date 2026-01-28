import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mfswd62b_cpd/widgets/asset_location_widget.dart';
import '../main.dart';
import '../mappers/asset_type_to_icon_mapper.dart';
import '../models/asset.dart';
import '../providers/asset_state_notifier.dart';
import './asset_button.dart';

class AdvancedAssetCardWidget extends ConsumerWidget {
  final Asset assetToDisplay;

  const AdvancedAssetCardWidget({ required this.assetToDisplay, super.key});

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
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AssetLocationWidget(assetToDisplay: assetToDisplay),
                    const SizedBox(height: 12),
                    Row(children: [
                      Icon(Icons.calendar_month),
                      SizedBox(width: 6),
                      Text('Date created', style: TextStyle(fontWeight: FontWeight.bold))
                    ]),
                    Row(
                      children: [
                        Text(assetToDisplay.formattedDate)
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(children: [
                      Icon(Icons.description),
                      SizedBox(width: 6),
                      Text("Description", style: TextStyle(fontWeight: FontWeight.bold))
                    ]),
                    Text(
                      assetToDisplay.description.isNotEmpty
                      ? assetToDisplay.description : 'No description available!'),
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
                    AssetButton(
                      iconData: Icons.delete,
                      backgroundColour: Colors.redAccent,
                      foregroundColour: Colors.white,
                      buttonText: 'Delete',
                      callback: () async {
                        bool? deleteConfirmed = await deleteConfirmationService.showDeleteConfirmationDialog(context);

                      if(deleteConfirmed != null && deleteConfirmed) {
                        ref.read(assetProvider.notifier).deleteAsset(assetToDisplay);

                        if(context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Asset deleted successfully!'))
                          );

                          Navigator.of(context).pop();
                        }
                      }
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