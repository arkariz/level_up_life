import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:level_up_life/domain/failure/custome_failure.dart';
import 'package:level_up_life/domain/failure/either_extention.dart';
import 'package:level_up_life/presentation/core/widgets/toast/custom_toast.dart';

BuildContext contextErrorHandle = Get.context!;

extension ErrorHandlerExtension<L, R> on Either<L, R> {
  B? onFold<B>(
    B Function(R) onSuccess, {
    B? Function(L l)? onOverrideFailure,
    B? Function(L l)? additionalFunctionFailure,
    B? Function(L l)? onFailure,
    B? Function(DecodeFailedFailure l)? onDecodeFailed,
    B? Function(NoInternetFailure l)? onNoInternet,
    B? Function(RequestTimeoutFailure l)? onRequestTimeout,
    B? Function(BadResponseFailure l)? onBadResponse,
    B? Function(FirebaseAuthFailure l)? onFirebaseAuth,
    VoidCallback? onRetry,
  }) {
    return handleError(
      onSuccess: onSuccess,
      additionalFunctionFailure: additionalFunctionFailure,
      overrideFailure: onOverrideFailure,
      onFailure: onFailure ??
          (L error) {
            if (error is Failure) {
              CustomToast.showError(error.message);
            }
            return null;
          },
      onDecodeFailed: onDecodeFailed ?? (failure) {
        CustomToast.showError(failure.message);
        return null;
      },
      onNoInternet: onNoInternet ?? (failure) {
        CustomToast.showError(failure.message);
        return null;
      },
      onRequestTimeout: onRequestTimeout ?? (failure) {
        CustomToast.showError(failure.message);
        return null;
      },
      onBadResponse: onBadResponse ?? (failure) {
        CustomToast.showError(failure.message);
        return null;
      },
      onFirebaseAuth: onFirebaseAuth ?? (failure) {
        CustomToast.showError(failure.message);
        return null;
      },
    );
  }
}
