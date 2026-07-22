import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tao/screens/videos/videos_screen.dart';

void main() {
  testWidgets('filters videos by category', (tester) async {
    tester.view.physicalSize = const Size(1200, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MaterialApp(home: VideosScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Todas'), findsOneWidget);
    expect(find.text('Educación'), findsWidgets);
    expect(find.text('Testimonio'), findsWidgets);
    expect(find.text('Campaña'), findsOneWidget);

    await tester.tap(find.text('Campaña'));
    await tester.pumpAndSettle();

    expect(find.text('Migraña y dolor de cabeza'), findsOneWidget);
    expect(find.text('Proceso en clinica TAO'), findsNothing);
    expect(tester.takeException(), isNull);
  });
}
