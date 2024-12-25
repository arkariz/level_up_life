import 'package:get_it/get_it.dart';
import 'package:level_up_life/data/module/book/datasource/book_remote_datasource.dart';
import 'package:level_up_life/data/module/book/datasource/impl_book_remote_datasource.dart';
import 'package:level_up_life/data/module/book/repository/impl_book_repository.dart';
import 'package:level_up_life/data/utility/service_manager/name_manager.dart';
import 'package:level_up_life/data/utility/service_manager/name_service_config.dart';
import 'package:level_up_life/domain/module/book/repository/book_repository.dart';

class DataDependenciesInjection {
  static void inject() {
    GetIt getIt = GetIt.instance;

    // Manager
    getIt.registerLazySingleton<NameManager>(() => NameManager());

    // Service Config
    getIt.registerLazySingleton<NameServiceConfig>(() => NameServiceConfig());

    // Datasource
    getIt.registerFactory<BookRemoteDatasource>(() => ImplBookRemoteDatasource(
      manager: getIt<NameManager>(),
      config: getIt<NameServiceConfig>(),
    ));

    // Repository
    getIt.registerFactory<BookRepository>(() => ImplBookRepository(GetIt.I<BookRemoteDatasource>()));
  }
}
