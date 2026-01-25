import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:uuid/uuid.dart';
import '../models/asset_location.dart';
import '../models/asset_type.dart';

const Uuid uuid = Uuid();

class Asset {
  @Id()
  int id = 0;

  String name;
  String serialNumber;
  String description;
  DateTime dateCreatedAt;
  AssetLocation assetLocation;

  @Property(type: PropertyType.byte)
  int assetTypeIndex;

  Asset({
    required this.name,
    required this.serialNumber,
    required this.description,
    required AssetType assetType,
    required this.assetLocation
  }) :
    this.assetTypeIndex = assetType.index,
    this.dateCreatedAt = DateTime.now();

  AssetType get assetType => AssetType.values[assetTypeIndex];
}