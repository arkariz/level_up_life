import 'package:dartz/dartz.dart';
import 'package:level_up_life/domain/failure/custome_failure.dart';
import 'package:level_up_life/domain/module/book/entity/book.dart';
import 'package:level_up_life/domain/module/book/request/request_book.dart';

abstract class BookRepository {
  Future<Either<Failure, List<Book>>> getBooks(RequestBook request);
}
