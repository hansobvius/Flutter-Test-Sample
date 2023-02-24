import 'package:flutter/material.dart';
import 'package:flutter_driver_sample/application/module/list_items/ui/list_items_view.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base_widget_test_launcher.dart';
import 'list_items_router.dart';

void main() {

  group('List item widget test', () {

    testWidgets('Test generated list', (tester) async {

      // Initialize
      await tester.pumpWidget(initializeSingleView(const ListItemsView()));
      await tester.pumpAndSettle();

      var circularProgress = find.byKey(const Key('CIRCULAR_PROGRESS'));
      expect(circularProgress, findsOneWidget, reason: 'Check if circular progress widget exists');

      await tester.pumpAndSettle();

      var listView = find.byKey(const Key('LIST_VIEW_SEPARATED'));
      expect(listView, findsOneWidget, reason: 'Check if list view widget exists');

      var firstListTile = find.byKey(const Key('0_LIST_TILE'));
      var lastListTile = find.byKey(const Key('999_LIST_TILE'));

      expect(firstListTile, findsOneWidget, reason: 'Check if first list element exists');
      expect(lastListTile, findsOneWidget, reason: 'Check if last list element exists');
    });
  });
}