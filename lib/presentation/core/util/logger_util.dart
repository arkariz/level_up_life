import 'package:level_up_life/data/utility/handler/errors_logger.dart';
import 'package:logger/logger.dart';

class LoggerUtil {
  static void setErrorsLog() {
    var logger = Logger(
      printer: PrettyPrinter(
        methodCount: 10,
        errorMethodCount: 50,
        lineLength: 150,
      ),
    );
    ErrorsLogger.setLogger(
      (message, exception, stackTrace) {
        logger.f(message, error: exception, stackTrace: stackTrace);
      },
    );
  }
}