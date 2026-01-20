class Validator {
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'El correo es obligatorio';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'La contraseña es obligatoria';
    }
    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    final hasUpperCase = RegExp(r'[A-Z]');
    if (!hasUpperCase.hasMatch(value)) {
      return 'La contraseña debe tener al menos una letra mayúscula';
    }
    return null;
  }
}