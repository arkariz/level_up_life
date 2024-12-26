import 'package:level_up_life/data/services/database/objectbox/objectbox.g.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  late final Store store;
  static String databaseName = "level_up_life";
  
  ObjectBox._create(this.store) {
    // Add any additional setup code, e.g. build queries.
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, databaseName));
    return ObjectBox._create(store);
  }

  static Future<Store> getStore() async {
    return await openStore();
  }
}