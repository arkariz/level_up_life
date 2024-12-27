import 'package:get_it/get_it.dart';
import 'package:level_up_life/data/module/activity/datasource/activity_local_datasource.dart';
import 'package:level_up_life/data/module/activity/datasource/activity_remote_datasource.dart';
import 'package:level_up_life/data/module/activity/repository/impl_activity_repository.dart';
import 'package:level_up_life/data/module/user/datasource/user_local_datasource.dart';
import 'package:level_up_life/data/module/user/datasource/user_remote_datasource.dart';
import 'package:level_up_life/data/module/user/repository/impl_user_repository.dart';
import 'package:level_up_life/data/services/database/base_box_store/base_box_store.dart';
import 'package:level_up_life/data/services/database/objectbox/objectbox.dart';
import 'package:level_up_life/data/services/firebase/auth/firebase_auth_sevice.dart';
import 'package:level_up_life/data/module/auth/datasource/auth_remote_datasource.dart';
import 'package:level_up_life/data/module/auth/datasource/impl_auth_remote_datasource.dart';
import 'package:level_up_life/data/module/auth/repository/impl_auth_repository.dart';
import 'package:level_up_life/data/services/service_manager/supabase_manager.dart';
import 'package:level_up_life/data/services/service_manager/supabase_service_config.dart';
import 'package:level_up_life/domain/module/activity/repository/activity_repository.dart';
import 'package:level_up_life/domain/module/auth/repository/auth_repository.dart';
import 'package:level_up_life/domain/module/user/repository/user_repository.dart';
import 'package:objectbox/objectbox.dart';

const objectboxDatabaseName = "level_up_life";
const objectboxTempDatabaseName = "temp_db";
class DataDependenciesInjection {
  static Future<void> inject() async {
    GetIt getIt = GetIt.instance;
    
    // Remote Datasource
    await registerNetworkServices();
    getIt.registerFactory<AuthRemoteDatasource>(() => ImplAuthRemoteDatasource(
      service: getIt<FirebaseAuthService>(),
    ));
    getIt.registerFactory<UserRemoteDatasource>(() => UserRemoteDatasource(
      manager: getIt<SupabaseManager>(),
      config: getIt<SupabaseServiceConfig>(),
    ));
    getIt.registerFactory<ActivityRemoteDatasource>(() => ActivityRemoteDatasource(
      manager: getIt<SupabaseManager>(),
      config: getIt<SupabaseServiceConfig>(),
    ));

    // Local Datwasource
    await registerDatabaseServices();
    getIt.registerFactory(() => ActivityLocalDatasource(baseBoxStore: getIt<BaseBoxStore>()));
    getIt.registerFactory(() => UserLocalDatasource(boxStore: getIt<Store>(instanceName: objectboxDatabaseName)));


    // Repository
    getIt.registerFactory<AuthRepository>(() => ImplAuthRepository(GetIt.I<AuthRemoteDatasource>()));
    getIt.registerFactory<ActivityRepository>(() => ImplActivityRepository(
      localActivityDatasource: GetIt.I<ActivityLocalDatasource>(),
      remoteActivityDatasource: GetIt.I<ActivityRemoteDatasource>(),
    ));
    getIt.registerFactory<UserRepository>(() => ImplUserRepository(
      localUserDatasource: GetIt.I<UserLocalDatasource>(),
      remoteUserDatasource: GetIt.I<UserRemoteDatasource>(),
    ));
  }

  static Future<void> registerNetworkServices() async {
    GetIt getIt = GetIt.instance;
    getIt.registerLazySingleton<SupabaseManager>(() => SupabaseManager());
    getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());

    getIt.registerLazySingleton<SupabaseServiceConfig>(() => SupabaseServiceConfig());
  }

  static Future<void> registerDatabaseServices() async {
    GetIt getIt = GetIt.instance;
    final box = await Objectbox.create();
    final boxTemp = await Objectbox.createTemporary();
    getIt.registerSingleton<Store>(box, instanceName: objectboxDatabaseName);
    getIt.registerSingleton<Store>(boxTemp, instanceName: objectboxTempDatabaseName);

    if (!getIt.isRegistered<BaseBoxStore>()) {
      getIt.registerFactory<BaseBoxStore>(() => BaseBoxStore(boxStore: getIt<Store>(instanceName: objectboxDatabaseName), temBoxStore: getIt<Store>(instanceName: objectboxTempDatabaseName)));
    }
  }

  static Future<void> unregisterDatabaseServices() async {
    GetIt getIt = GetIt.instance;
    if (getIt.isRegistered<Store>(instanceName: objectboxDatabaseName)) {
      await getIt.unregister<Store>(instanceName: objectboxDatabaseName, disposingFunction: (store) => store.isClosed() ? null : store.close());
    }
    if (getIt.isRegistered<Store>(instanceName: objectboxTempDatabaseName)) {
      await getIt.unregister<Store>(instanceName: objectboxTempDatabaseName, disposingFunction: (store) => store.isClosed() ? null : store.close());
    }
  }
}
