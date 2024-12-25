extension StringExtension on String {
  bool isValidEmail() {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
  }

  bool isValidPhoneNumber() {
    return RegExp(r"^(^\+62\s?|^0)(\d{3,4}-?){2}\d{3,4}$").hasMatch(this);
  }

  bool isNoSpecialCharacter() {
    return RegExp(r"^[a-zA-Z0-9 ]+$").hasMatch(this);
  }
}