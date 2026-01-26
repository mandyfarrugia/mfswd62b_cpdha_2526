import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mfswd62b_cpd/main.dart';
import 'package:mfswd62b_cpd/models/asset_location.dart';
import 'package:mfswd62b_cpd/services/location_service.dart';
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

  Future<void> addAsset(Asset asset) async {
    final locationFetchedFromGeolocator = await LocationService.fetchCurrentLocation();
    objectBoxStoreService.store.box<AssetLocation>().put(locationFetchedFromGeolocator);
    asset.assetLocation.target = locationFetchedFromGeolocator;
    objectBoxStoreService.assetBox.put(asset);
    this.loadAssets();
  }

  void deleteAsset(Asset asset) {
    objectBoxStoreService.assetBox.remove(asset.id);
    this.loadAssets();
  }
}