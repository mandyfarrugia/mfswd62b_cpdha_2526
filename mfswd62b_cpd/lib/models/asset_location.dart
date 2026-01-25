import 'package:objectbox/objectbox.dart';

@Entity()
class AssetLocation {
  @Id()
  int id = 0;

  double latitude;
  double longitude;

  AssetLocation({ required this.latitude, required this.longitude });
}