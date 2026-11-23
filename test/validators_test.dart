import 'package:flutter_test/flutter_test.dart';
import 'package:tu_solution/core/utils/validators.dart';

void main() {
  group('FormValidators - validatePhone', () {
    test('Retorna error cuando el teléfono está vacío', () {
      expect(FormValidators.validatePhone(''), equals('El teléfono es obligatorio'));
      expect(FormValidators.validatePhone('   '), equals('El teléfono es obligatorio'));
      expect(FormValidators.validatePhone(null), equals('El teléfono es obligatorio'));
    });

    test('Retorna error cuando contiene letras o caracteres especiales', () {
      expect(FormValidators.validatePhone('300abc1234'), equals('El teléfono solo debe contener números'));
      expect(FormValidators.validatePhone('300-123-456'), equals('El teléfono solo debe contener números'));
    });

    test('Retorna error cuando tiene menos de 7 dígitos', () {
      expect(FormValidators.validatePhone('12345'), equals('El teléfono debe tener al menos 7 dígitos'));
    });

    test('Retorna error cuando tiene más de 15 dígitos', () {
      expect(FormValidators.validatePhone('1234567890123456'), equals('El teléfono no puede superar 15 dígitos'));
    });

    test('Retorna null cuando el teléfono es válido', () {
      expect(FormValidators.validatePhone('3001234567'), isNull);
      expect(FormValidators.validatePhone('6011234567'), isNull);
    });
  });

  group('FormValidators - validateName', () {
    test('Retorna error cuando el nombre está vacío o es muy corto', () {
      expect(FormValidators.validateName(''), equals('El nombre es obligatorio'));
      expect(FormValidators.validateName('Ab'), equals('El nombre debe tener al menos 3 caracteres'));
    });

    test('Retorna error cuando contiene números o símbolos inválidos', () {
      expect(FormValidators.validateName('Juan123'), equals('El nombre solo debe contener letras'));
      expect(FormValidators.validateName('Maria_Gomez'), equals('El nombre solo debe contener letras'));
    });

    test('Retorna null para nombres válidos con espacios y acentos', () {
      expect(FormValidators.validateName('Juan Pérez'), isNull);
      expect(FormValidators.validateName('María José De la Cruz'), isNull);
    });
  });

  group('FormValidators - validatePositiveInteger', () {
    test('Valida números enteros correctamente', () {
      expect(FormValidators.validatePositiveInteger('', 'Stock'), equals('Stock es obligatorio'));
      expect(FormValidators.validatePositiveInteger('abc', 'Stock'), equals('Stock debe ser un número entero válido'));
      expect(FormValidators.validatePositiveInteger('-5', 'Stock', min: 0), equals('Stock no puede ser menor que 0'));
      expect(FormValidators.validatePositiveInteger('10', 'Stock'), isNull);
    });
  });
}
