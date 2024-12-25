import 'package:level_up_life/presentation/core/widgets/text_field/validation/validator/validator.dart';

class CustomValidator extends Validator {
  final Function(String val)? function;

  CustomValidator({
    this.function,
  });

  @override
  String? validate(String value) {
    return function!(value);
  }
}
