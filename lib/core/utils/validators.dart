class FormValidators {
  /// Valida que el campo no esté vacío.
  static String? required(String? value, [String fieldName = 'Este campo']) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName es obligatorio';
    }
    return null;
  }

  /// Valida nombres de personas (solo letras, espacios y tildes, min 3 caracteres).
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'El nombre es obligatorio';
    }
    final trimmed = value.trim();
    if (trimmed.length < 3) {
      return 'El nombre debe tener al menos 3 caracteres';
    }
    final nameRegExp = RegExp(r"^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s\.-]+$");
    if (!nameRegExp.hasMatch(trimmed)) {
      return 'El nombre solo debe contener letras';
    }
    return null;
  }

  /// Valida números de teléfono (solo dígitos, entre 7 y 15 números).
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'El teléfono es obligatorio';
    }
    final trimmed = value.trim();
    final digitsRegExp = RegExp(r'^\d+$');
    if (!digitsRegExp.hasMatch(trimmed)) {
      return 'El teléfono solo debe contener números';
    }
    if (trimmed.length < 7) {
      return 'El teléfono debe tener al menos 7 dígitos';
    }
    if (trimmed.length > 15) {
      return 'El teléfono no puede superar 15 dígitos';
    }
    return null;
  }

  /// Valida longitud mínima de un texto.
  static String? validateMinLength(String? value, int minLength, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName es obligatorio';
    }
    if (value.trim().length < minLength) {
      return '$fieldName debe tener al menos $minLength caracteres';
    }
    return null;
  }

  /// Valida números enteros positivos (ej: stock, precio, cantidad).
  static String? validatePositiveInteger(String? value, String fieldName, {int min = 0}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName es obligatorio';
    }
    final parsed = int.tryParse(value.trim());
    if (parsed == null) {
      return '$fieldName debe ser un número entero válido';
    }
    if (parsed < min) {
      return '$fieldName no puede ser menor que $min';
    }
    return null;
  }

  /// Valida números decimales/montos (ej: precio en dinero).
  static String? validateAmount(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName es obligatorio';
    }
    final parsed = double.tryParse(value.trim().replaceAll(',', '.'));
    if (parsed == null) {
      return '$fieldName debe ser un monto válido';
    }
    if (parsed <= 0) {
      return '$fieldName debe ser mayor a 0';
    }
    return null;
  }
}
