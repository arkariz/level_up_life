import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:level_up_life/domain/failure/custome_failure.dart';
import 'package:level_up_life/domain/failure/either_extention.dart';
import 'package:toastification/toastification.dart';

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
              ErrorToast.onFailure(error);
            }
            return null;
          },
      onDecodeFailed: onDecodeFailed ?? (failure) {
        ErrorToast.onFailure(failure);
        return null;
      },
      onNoInternet: onNoInternet ?? (failure) {
        ErrorToast.onFailure(failure);
        return null;
      },
      onRequestTimeout: onRequestTimeout ?? (failure) {
        ErrorToast.onFailure(failure);
        return null;
      },
      onBadResponse: onBadResponse ?? (failure) {
        ErrorToast.onFailure(failure);
        return null;
      },
      onFirebaseAuth: onFirebaseAuth ?? (failure) {
        ErrorToast.onFailure(failure);
        return null;
      },
    );
  }
}

class ErrorToast {
  static void onFailure(Failure failure) {
    toastification.show(
      context: contextErrorHandle,
      description: Text(failure.message),
      autoCloseDuration: const Duration(seconds: 5),
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored
    );
  }
}
