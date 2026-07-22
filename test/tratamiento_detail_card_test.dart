import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tao/data/zona_rio_data.dart';
import 'package:tao/widgets/tratamiento_detail_card.dart';

void main() {
  testWidgets('copies the complete treatment information', (tester) async {
    final tratamiento = tratamientosZonaRio.first;
    String? copiedText;

    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      SystemChannels.platform,
      (call) async {
        if (call.method == 'Clipboard.setData') {
          copiedText =
              (call.arguments as Map<Object?, Object?>)['text'] as String?;
        }
        return null;
      },
    );
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        null,
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: TratamientoDetailCard(tratamiento: tratamiento),
          ),
        ),
      ),
    );

    final copyButton = find.text('Copiar todo');
    await tester.ensureVisible(copyButton);
    await tester.tap(copyButton);
    await tester.pump();

    expect(copiedText, isNotNull);
    expect(copiedText!, contains(tratamiento.titulo));
    expect(copiedText!, contains(tratamiento.descripcion));
    expect(copiedText!, contains(tratamiento.beneficios));
    expect(copiedText!, contains(tratamiento.pagos));
    expect(find.text('Información del tratamiento copiada'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
