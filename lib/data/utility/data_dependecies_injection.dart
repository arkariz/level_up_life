import 'package:get_it/get_it.dart';
import 'package:level_up_life/data/firebase/auth/firebase_auth_sevice.dart';
import 'package:level_up_life/data/module/auth/datasource/auth_remote_datasource.dart';
import 'package:level_up_life/data/module/auth/datasource/impl_auth_remote_datasource.dart';
import 'package:level_up_life/data/module/auth/repository/impl_auth_repository.dart';
import 'package:level_up_life/data/module/book/datasource/book_remote_datasource.dart';
import 'package:level_up_life/data/module/book/datasource/impl_book_remote_datasource.dart';
import 'package:level_up_life/data/module/book/repository/impl_book_repository.dart';
import 'package:level_up_life/data/utility/service_manager/name_manager.dart';
import 'package:level_up_life/data/utility/service_manager/name_service_config.dart';
import 'package:level_up_life/domain/module/auth/repository/auth_repository.dart';
import 'package:level_up_life/domain/module/book/repository/book_repository.dart';

class DataDependenciesInjection {
  static void inject() {
    GetIt getIt = GetIt.instance;

    // Manager
    getIt.registerLazySingleton<NameManager>(() => NameManager());
    getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());

    // Service Config
    getIt.registerLazySingleton<NameServiceConfig>(() => NameServiceConfig());

    // Datasource
    getIt.registerFactory<BookRemoteDatasource>(() => ImplBookRemoteDatasource(
      manager: getIt<NameManager>(),
      config: getIt<NameServiceConfig>(),
    ));

    getIt.registerFactory<AuthRemoteDatasource>(() => ImplAuthRemoteDatasource(
      service: getIt<FirebaseAuthService>(),
    ));

    // Repository
    getIt.registerFactory<BookRepository>(() => ImplBookRepository(GetIt.I<BookRemoteDatasource>()));
    getIt.registerFactory<AuthRepository>(() => ImplAuthRepository(GetIt.I<AuthRemoteDatasource>()));
  }
}
