import 'package:get/get.dart';
import 'package:level_up_life/domain/module/auth/repository/auth_repository.dart';
import 'package:level_up_life/domain/module/book/entity/book.dart';
import 'package:level_up_life/domain/module/book/repository/book_repository.dart';
import 'package:level_up_life/domain/module/book/request/request_book.dart';
import 'package:level_up_life/presentation/core/routes/app_routes.dart';
import 'package:level_up_life/presentation/core/util/error_handler.dart';

class ExampleController extends GetxController {
  ExampleController({
    required this.bookRepository,
    required this.authRepository,
  });

  final BookRepository bookRepository;
  final AuthRepository authRepository;

  @override
  void onInit() {
    super.onInit();
    fetchBooks();
  }

  final _books = <Book>[].obs;
  RxList<Book> get books => _books;

  Future<void> fetchBooks() async {
    final request = RequestBook(
      page: 1,
    );
    final response = await bookRepository.getBooks(request); 

    response.fold(
      (error) {

      }, 
      (result) {
        _books.addAll(result);
      },
    );
  }

  Future<void> logout() async {
    final response = await authRepository.logout();

    response.onFold(
      (result) {
        Get.offAllNamed(AppRoutes.login);
      }
    );
  }
}