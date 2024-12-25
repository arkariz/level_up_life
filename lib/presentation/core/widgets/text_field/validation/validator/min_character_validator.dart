import 'package:level_up_life/presentation/core/widgets/text_field/validation/validator/validator.dart';

class MinCharacterValidator extends Validator {
  final int minCharacter;
  MinCharacterValidator({required this.minCharacter});
  
  @override
  String? validate(String value) {
    if (value.length < minCharacter) {
      return 'This field must be more than $minCharacter characters';
    }
    
    return null;
  }
}