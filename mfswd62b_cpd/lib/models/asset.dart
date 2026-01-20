import 'package:mfswd62b_cpd/models/asset_location.dart';
import 'package:uuid/uuid.dart';

const Uuid uuid = Uuid();

class Asset {
  final String id;
  final String name;
  final String description;
  final DateTime dateCreatedAt;
  final AssetLocation assetLocation;

  Asset({ required this.name, required this.description, required this.assetLocation }) : id = uuid.v4(), dateCreatedAt = DateTime.now();
}