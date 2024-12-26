import 'package:level_up_life/app/extension/string_extension.dart';
import 'package:level_up_life/presentation/core/widgets/text_field/validation/validator/validator.dart';

class PhoneNumberValidator extends Validator {
  @override
  String? validate(String value) {
    if (!value.isValidPhoneNumber()) {
      return 'Phone number must be valid';
    }

    return null;
  }
}
