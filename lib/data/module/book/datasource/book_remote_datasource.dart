import 'package:level_up_life/data/module/book/model/book_model.dart';
import 'package:level_up_life/domain/module/book/request/request_book.dart';

abstract class BookRemoteDatasource {
  Future<BooksModel> getBooks(RequestBook request);
}