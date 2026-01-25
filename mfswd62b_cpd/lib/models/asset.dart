import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:uuid/uuid.dart';
import '../models/asset_location.dart';
import '../models/asset_type.dart';

const Uuid uuid = Uuid();

class Asset {
  @Id()
  int id = 0;

  final String name;
  final String serialNumber;
  final String description;
  final AssetType assetType;
  final DateTime dateCreatedAt;
  final AssetLocation assetLocation;

  Asset({
    required this.name,
    required this.serialNumber,
    required this.description,
    required this.assetType,
    required this.assetLocation
  }) :
    dateCreatedAt = DateTime.now();

  String getAssetTypeName() {
    String assetTypeByName = this.assetType.name;
    return assetTypeByName.characters.elementAt(0).toUpperCase() + assetTypeByName.substring(1, assetTypeByName.characters.length);
  }
}