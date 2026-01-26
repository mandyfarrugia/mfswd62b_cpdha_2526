import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mfswd62b_cpd/providers/asset_state_notifier.dart';
import 'package:mfswd62b_cpd/widgets/asset_management_individual.dart';

class AssetListRender extends ConsumerWidget {
  const AssetListRender({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assets = ref.watch(assetProvider);

    return assets.isEmpty ?
      const Center(child: Text('Sorry, no assets available at the moment!')) :
      ListView.builder(
        itemCount: assets.length,
        itemBuilder: (context, index) {
        return AssetManagementIndividual(
          assetToDisplay: assets[index]
        );
      },
    );
  }
}