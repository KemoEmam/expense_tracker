import 'package:logger/logger.dart';

class LogHelper {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 5,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  static Logger get logger => _logger;

  static void info(String message) {
    _logger.i(message);
  }

  static String warning(String message) {
    _logger.w(message);
    return message;
  }
}
