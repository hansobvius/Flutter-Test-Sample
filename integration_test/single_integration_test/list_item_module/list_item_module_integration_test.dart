import 'package:flutter/material.dart';
import 'package:flutter_driver_sample/application/module/list_items/ui/list_items_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../../../test/widget_test/base_widget_test_launcher.dart';

void main() {

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('List item widget test', () {

    testWidgets('Test generated list', (WidgetTester tester) async {

      await tester.runAsync(() async {

        /// Initialize
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

          final listViewFinder = find.byType(ListView);

          final listViewHeight = tester.getSize(listViewFinder).height;
          final listTileHeight = tester.getSize(firstListTile).height;

          /// Calculation to retrieve how many scrolls count are needed
          /// to reach last element presented from list view
          final totalItemsPerView = listViewHeight / (listTileHeight + 16.0);
          final maxScrollCounts = 1000 / totalItemsPerView;

          final scrollableFinder = find
              .descendant(of: listViewFinder, matching: find.byType(Scrollable));

          final itemFinder = find.byKey(const ValueKey('999_LIST_TILE'));

          await tester.scrollUntilVisible(
            itemFinder,
            listViewHeight,
            maxScrolls: maxScrollCounts.toInt(),
            scrollable: scrollableFinder,
          );

          expect(itemFinder, findsOneWidget,
              reason: 'Check if last element from data list are presented on list view widget');
        });
      });

    });
  });
}