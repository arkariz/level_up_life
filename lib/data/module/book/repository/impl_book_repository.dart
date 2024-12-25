import 'package:dartz/dartz.dart';
import 'package:level_up_life/data/module/book/datasource/book_remote_datasource.dart';
import 'package:level_up_life/data/utility/handler/repository_handler.dart';
import 'package:level_up_life/domain/failure/custome_failure.dart';
import 'package:level_up_life/domain/module/book/entity/book.dart';
import 'package:level_up_life/domain/module/book/repository/book_repository.dart';
import 'package:level_up_life/domain/module/book/request/request_book.dart';

class ImplBookRepository extends RepositoryHandler implements BookRepository {
  ImplBookRepository(this._remoteDataSource);
  
  final BookRemoteDatasource _remoteDataSource;

  @override
  Future<Either<Failure, List<Book>>> getBooks(RequestBook request) async {
    return handleOperation(() async {
      final response = await _remoteDataSource.getBooks(request);
      return response.toEntity();
    });
  }
}
