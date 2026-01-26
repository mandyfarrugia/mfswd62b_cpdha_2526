import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mfswd62b_cpd/main.dart';
import '../models/asset.dart';

final assetProvider = StateNotifierProvider<AssetStateNotifier, List<Asset>>(
  (ref) {
    return AssetStateNotifier();
  }
);

class AssetStateNotifier extends StateNotifier<List<Asset>> {
  AssetStateNotifier() : super([]) {
    this.loadAssets();
  }

  void loadAssets() {
    super.state = objectBoxStoreService.assetBox.getAll();
  }

  void addAsset(Asset asset) {
    objectBoxStoreService.assetBox.put(asset);
    this.loadAssets();
  }

  void deleteAsset(Asset asset) {
    objectBoxStoreService.assetBox.remove(asset.id);
    this.loadAssets();
  }
}