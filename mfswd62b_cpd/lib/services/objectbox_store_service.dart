import 'package:path_provider/path_provider.dart';
import '../models/asset.dart';
import '../objectbox.g.dart';

class ObjectBoxStoreService {
  late final Store store;
  late final Box<Asset> assetBox;

  ObjectBoxStoreService._create(this.store) {
    assetBox = Box<Asset>(store);
  }

  static Future<ObjectBoxStoreService> create() async {
    final directory = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: '${directory.path}/objectbox');
    return ObjectBoxStoreService._create(store);
  }
}
