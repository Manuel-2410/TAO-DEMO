import 'package:flutter_test/flutter_test.dart';
import 'package:tao/data/sintomas_data.dart';

void main() {
  test('every symptom has complete, specific content', () {
    const validCategories = {
      'Dolor',
      'Emocional',
      'Digestivo',
      'Neurológico',
      'Reproductivo',
      'Metabolismo',
      'Clínico',
    };

    expect(sintomas, hasLength(15));
    expect(sintomas.map((item) => item.nombre).toSet(), hasLength(15));

    for (final sintoma in sintomas) {
      expect(validCategories, contains(sintoma.categoria));
      expect(sintoma.descripcion.length, greaterThan(100));
      expect(sintoma.comoayuda.length, greaterThan(100));

      for (final spinText in [
        sintoma.situacion,
        sintoma.problema,
        sintoma.implicacion,
        sintoma.necesidad,
      ]) {
        expect(spinText.split('\n'), hasLength(greaterThanOrEqualTo(3)));
        expect('¿'.allMatches(spinText), hasLength(greaterThanOrEqualTo(3)));
        expect('?'.allMatches(spinText), hasLength(greaterThanOrEqualTo(3)));
      }
    }
  });

  test('SPIN sections are not duplicated between symptoms', () {
    final spinSections = <String>{};

    for (final sintoma in sintomas) {
      for (final spinText in [
        sintoma.situacion,
        sintoma.problema,
        sintoma.implicacion,
        sintoma.necesidad,
      ]) {
        expect(spinSections.add(spinText), isTrue);
      }
    }
  });
}
