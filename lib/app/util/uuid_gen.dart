import 'package:uuid/uuid.dart';

class UuidGen {
  static String generate() {
    return const Uuid().v6();
  }
}