import 'package:flutter/material.dart';
import 'package:flutter_driver_sample/application/module/list_items/ui/list_items_view.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base_widget_test_launcher.dart';
import 'list_items_router.dart';

void main() {

  group('List item widget test', () {

    testWidgets('Test generated list', (WidgetTester tester) async {

      await tester.runAsync(() async {

        // Initialize
        await tester.pumpWidget(initializeSingleView(const ListItemsView()));
        await tester.pump();

      }).then((value) async {

        var itemViewBuilder = find.byKey(const Key('ITEM_VIEW_BUILD'));
        expect(itemViewBuilder, findsOneWidget, reason: 'Check if ListItemView was built');

        var circularProgress = find.byKey(const Key('CIRCULAR_PROGRESS'));
        expect(circularProgress, findsOneWidget, reason: 'Check if circular progress widget exists');

        await tester.runAsync(() async {
          await Future.delayed(const Duration(seconds: 10));

          await tester.pump();

          var listView = find.byKey(const Key('LIST_VIEW_SEPARATED'));
          expect(listView, findsOneWidget, reason: 'Check if list view widget exists');

          var firstListTile = find.byKey(const Key('0_LIST_TILE'));
          expect(firstListTile, findsOneWidget, reason: 'Check if first list element exists');

          /// FIXME - doesn't work
          // final listViewFinder = find.byType(ListView);
          // final listViewHeight = tester.getSize(listViewFinder).height;
          // await tester.scrollUntilVisible(
          //     listViewFinder,
          //     1.0 ,
          //     scrollable: find.byType(ListTile),
          //     duration: const Duration(seconds: 1));

          final listViewFinder = find.byType(ListView);
          final listViewHeight = tester.getSize(listViewFinder).height;
          await tester.scrollUntilVisible(
              listViewFinder,
              listViewHeight,
              duration: Duration(seconds: 5));

          // await tester.scrollUntilVisible(find.byType(ListView), 1000.0);

          // var lastListTile = find.byKey(const Key('1000_LIST_TILE'));
          var lastListTile = find.byType(ListTile).last;
          expect(lastListTile, findsOneWidget, reason: 'Check if last list element exists');
        });
      });

    });
  });
}