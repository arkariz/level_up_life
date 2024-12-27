import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:level_up_life/data/services/database/objectbox/objectbox.g.dart';
import 'package:level_up_life/data/utility/data_dependecies_injection.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class Objectbox {
  static Store? store; 
  static Store? storeTemp;
  static String databaseName = "level_up_life";
  static String tempDatabase = "temp_db";

  static Future<Store> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    store = await openStore(directory: p.join(docsDir.path, databaseName));
    return store!;
  }

  static Future<Store> createTemporary() async {
    final docsDir = await getApplicationDocumentsDirectory();
    storeTemp = await openStore(directory: p.join(docsDir.path, tempDatabase));
    return storeTemp!;
  }

  static Future<void> deleteTemporatyDbFiles() async {
    final getIt = GetIt.instance;
    await deleteFile(tempDatabase);
    await getIt.unregister<Store>(instanceName: objectboxTempDatabaseName, disposingFunction: (store) => store.isClosed() ? null : store.close());
    
    final boxTemp = await Objectbox.createTemporary();
    getIt.registerSingleton<Store>(boxTemp, instanceName: objectboxTempDatabaseName);
  }

  static Future<void> deleteAllDbFiles() async {
    await deleteFile(tempDatabase);
    await deleteFile(databaseName);
    await DataDependenciesInjection.unregisterDatabaseServices();
    await DataDependenciesInjection.registerDatabaseServices();
  }

  static Future<void> deleteFile(String file) async {
    final appDirectory = await getApplicationDocumentsDirectory();
    final objBoxDirectory = Directory('${appDirectory.path}/$file');
    final isExists = await objBoxDirectory.exists();
    if(isExists){
      await objBoxDirectory.delete(recursive: true);
    }
  }
}