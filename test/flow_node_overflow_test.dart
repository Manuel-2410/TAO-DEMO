import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tao/data/lead_flow_data.dart';
import 'package:tao/widgets/flow_node_widget.dart';

void main() {
  Future<void> renderAllCards(
    WidgetTester tester, {
    required double textScaleFactor,
  }) async {
    tester.view.physicalSize = const Size(1400, 950);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(
            size: const Size(1400, 950),
            textScaler: TextScaler.linear(textScaleFactor),
          ),
          child: Scaffold(
            body: Stack(
              children: [
                for (final node in flowNodes)
                  FlowNodeWidget(node: node, onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  }

  testWidgets('all flow cards fit in the overview', (tester) async {
    await renderAllCards(tester, textScaleFactor: 1);
  });

  testWidgets('all flow cards fit with enlarged text', (tester) async {
    await renderAllCards(tester, textScaleFactor: 1.5);
  });
}
