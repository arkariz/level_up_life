import 'package:firebase_auth/firebase_auth.dart';
import 'package:level_up_life/data/utility/exception/custome_exception.dart';
import 'package:level_up_life/data/utility/handler/errors_logger.dart';

class DatasourceHandler {
  Future<T> handleRequest<T>(
    Future<T> Function() operation,
  ) async {
    try {
      return await operation();
    } on NoInternetException catch (error) {
      ErrorsLogger.logError(error.message, error, error.stackTrace);
      rethrow;
    } on RequestTimeoutException catch (error) {
      ErrorsLogger.logError(error.message, error, error.stackTrace);
      rethrow;
    } on BadResponseException catch (error) {
      ErrorsLogger.logError(error.message, error, error.stackTrace);
      rethrow;
    } on FirebaseAuthException catch (error) {
      ErrorsLogger.logError(error.message ?? "FirebaseAuthException", error, error.stackTrace);
      rethrow;
    } catch (error, stackTrace) {
      ErrorsLogger.logError(error.toString(), error, stackTrace);
      rethrow;
    }
  }

  T handleDecode<T>(T Function() operation) {
    try {
      return operation();
    } catch (error, stackTrace) {
      DecodeFailedException exception = DecodeFailedException(message: error.toString(), exception: error, stackTrace: stackTrace);
      ErrorsLogger.logError(error.toString(), exception, stackTrace);
      throw exception;
    }
  }
}