import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:level_up_life/domain/module/book/repository/book_repository.dart';
import 'package:level_up_life/presentation/module/example/example_controller.dart';

class ExampleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleController>(() => ExampleController(
      bookRepository: GetIt.I<BookRepository>(),
      authRepository: GetIt.I(),
    ));
  }
}