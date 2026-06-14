class AppValidator {
  // email validator
  static String? emailValidationStatus(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }

    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }

    return null;
  }

  // pass validator
  static String? PasswordValidationStatus(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 charachters';
    }

    return null;
  }
}
