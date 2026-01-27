import 'package:intl/intl.dart';
import 'package:objectbox/objectbox.dart';
import 'package:uuid/uuid.dart';
import '../models/asset_location.dart';
import '../models/asset_type.dart';

const Uuid uuid = Uuid();
DateFormat longDatePattern = DateFormat('dd MMMM yyyy');

@Entity()
class Asset {
  @Id()
  int id = 0;

  final assetLocation = ToOne<AssetLocation>();
  
  String name;
  String serialNumber;
  String description;

  @Property(type: PropertyType.date)
  DateTime dateCreatedAt;

  @Property(type: PropertyType.byte)
  int assetTypeIndex;

  Asset({
    required this.name,
    required this.serialNumber,
    required this.description,
    required this.assetTypeIndex,
  }) :
    this.dateCreatedAt = DateTime.now();

  AssetType get assetType => AssetType.values[assetTypeIndex];

  String get formattedDate {
    return longDatePattern.format(dateCreatedAt);
  }
}