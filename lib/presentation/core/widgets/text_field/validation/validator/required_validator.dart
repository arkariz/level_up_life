import 'package:level_up_life/presentation/core/widgets/text_field/validation/validator/validator.dart';

class RequiredValidator extends Validator {
  
  @override
  String? validate(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}
