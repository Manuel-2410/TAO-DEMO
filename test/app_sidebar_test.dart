import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:tao/models/app_section.dart';
import 'package:tao/providers/navigation_provider.dart';
import 'package:tao/widgets/app_sidebar.dart';

void main() {
  testWidgets('sidebar collapses without overflow and keeps navigation', (
    tester,
  ) async {
    final navigation = NavigationProvider();

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: navigation,
        child: const MaterialApp(
          home: Scaffold(
            body: Row(
              children: [
                AppSidebar(),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
        ),
      ),
    );

    expect(tester.getSize(find.byType(AppSidebar)).width, 250);

    await tester.tap(find.byTooltip('Contraer menú'));
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(tester.getSize(find.byType(AppSidebar)).width, 76);
    expect(find.byTooltip('Videos'), findsOneWidget);

    await tester.tap(find.byTooltip('Videos'));
    await tester.pump();

    expect(navigation.current, AppSection.videos);

    await tester.tap(find.byTooltip('Expandir menú'));
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(tester.getSize(find.byType(AppSidebar)).width, 250);
    expect(find.text('Videos'), findsOneWidget);
  });
}
