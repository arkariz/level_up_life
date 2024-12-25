import 'package:level_up_life/presentation/core/widgets/text_field/validation/validator/validator.dart';

class MaxCharacterValidator extends Validator {
  final int maxCharacter;
  MaxCharacterValidator({required this.maxCharacter});
  
  @override
  String? validate(String value) {
    if (value.length > maxCharacter) {
      return 'This field must be less than $maxCharacter characters';
    }

    return null;
  }
}