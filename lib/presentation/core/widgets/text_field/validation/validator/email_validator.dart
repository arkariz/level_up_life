import 'package:level_up_life/presentation/core/extension/string_extension.dart';
import 'package:level_up_life/presentation/core/widgets/text_field/validation/validator/validator.dart';

class EmailValidator extends Validator {
  
  @override
  String? validate(String value) {
    if (!value.isValidEmail()) {
      return 'This field must be a valid email';
    }

    return null;
  }
}