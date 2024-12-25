import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:level_up_life/data/exception/custome_exception.dart';
import 'package:level_up_life/domain/failure/custome_failure.dart';

class RepositoryHandler {
  Future<Either<Failure, T>> handleOperation<T>(
    Future<T?> Function() operation,
  ) async {
    try {
      final result = await operation();
      return Right(result as T);
    } on RequestTimeoutException catch (_) {
      return const Left(RequestTimeoutFailure());
    } on DecodeFailedException catch (_) {
      return const Left(DecodeFailedFailure());
    } on NoInternetException catch (_){
      return const Left(NoInternetFailure());
    } on BadResponseException catch (e) {
      return Left(BadResponseFailure(message: e.message));
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthFailure(message: e.message ?? "Firebase auth failure"));
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}