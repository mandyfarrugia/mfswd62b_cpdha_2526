import 'package:mfswd62b_cpd/models/asset_location.dart';
import 'package:mfswd62b_cpd/models/asset_type.dart';
import 'package:uuid/uuid.dart';

const Uuid uuid = Uuid();

class Asset {
  final String id;
  final String name;
  final String serialNumber;
  final String description;
  final AssetType assetType;
  final DateTime dateCreatedAt;
  final AssetLocation assetLocation;

  Asset({ required this.name, required this.serialNumber, required this.description, required this.assetType, required this.assetLocation }) : id = uuid.v4(), dateCreatedAt = DateTime.now();
}