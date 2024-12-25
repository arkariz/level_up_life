import 'package:level_up_life/presentation/core/extension/string_extension.dart';
import 'package:level_up_life/presentation/core/widgets/text_field/validation/validator/validator.dart';

class SpecialCharacterValidator extends Validator {

  @override
  String? validate(String value) {
    if (!value.isNoSpecialCharacter()) {
      return 'This field must be without special character';
    }

    return null;
  }
}
