import 'package:level_up_life/data/module/book/datasource/book_remote_datasource.dart';
import 'package:level_up_life/data/module/book/model/book_model.dart';
import 'package:level_up_life/data/utility/handler/datasource_handler.dart';
import 'package:level_up_life/data/utility/service_manager/name_manager.dart';
import 'package:level_up_life/data/utility/service_manager/name_service_config.dart';
import 'package:level_up_life/domain/module/book/request/request_book.dart';

class ImplBookRemoteDatasource extends DatasourceHandler implements BookRemoteDatasource {  
  ImplBookRemoteDatasource({required this.manager, required this.config});
  
  final NameManager manager;
  final NameServiceConfig config;

  @override
  Future<BooksModel> getBooks(RequestBook request) async{
    return handleDecode(() async {
      final response = await manager.get(
        endpoint: _EndPoint.books,
        data: request.toJson(),
        additionalHeaders: config.tokenHeader,
      );

      return BooksModel.fromJson(response);
    });
  }
}

class _EndPoint {
  static String books = "en/books";
}
