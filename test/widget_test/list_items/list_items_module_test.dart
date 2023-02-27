import 'package:flutter/material.dart';
import 'package:flutter_driver_sample/application/module/list_items/ui/list_items_view.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base_widget_test_launcher.dart';
import 'list_items_router.dart';

void main() {

  Future<Finder> widgetScroll(WidgetTester tester, [Finder? obj]) async {
    await tester.scrollUntilVisible(
        obj ?? find.byType(ListTile).last,
        1000,
        duration: const Duration(seconds: 1));
    Finder lastListTile = find.byType(ListTile).last;
    print('LIST_TILE_KEY ${lastListTile.evaluate()}');
    if (int.parse(
        lastListTile.evaluate().toString()
            .split('<').last
            .split('>').first
            .split('_').first
            .replaceAll("'", "")) < 1000) {
      await widgetScroll(tester, lastListTile);
    }
    return find.byType(ListTile).last;
  }

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


          final listViewFinder = find.byType(ListView);
          final listViewHeight = tester.getSize(listViewFinder).height;

          final scrollableFinder = find.descendant( of: listViewFinder, matching: find.byType(Scrollable), );

          // await tester.scrollUntilVisible(
          //     listViewFinder,
          //     listViewHeight * 1000,
          //     scrollable: scrollableFinder,
          //     duration: Duration(seconds: 1));

          final listFinder = find.byType(Scrollable);
          final itemFinder = find.byKey(const ValueKey('6_LIST_TILE'));

          await tester.scrollUntilVisible(
            itemFinder,
            listViewHeight * 1000,
            scrollable: scrollableFinder,
          );

          print('LIST_TILE_KEY ${itemFinder.evaluate()}');

          expect(itemFinder, findsOneWidget);

          // await tester.scrollUntilVisible(find.byType(ListView), 1000.0);

          // var lastListTile = find.byKey(const Key('1000_LIST_TILE'));
          // Finder lastListTile = find.byType(ListTile).last;
          // print('LIST_TILE_KEY ${lastListTile.evaluate()}');
          // expect(lastListTile, findsOneWidget, reason: 'Check if last list element exists');

          // var result = await widgetScroll(tester);
          // expect(result, findsOneWidget, reason: 'Check if last list element exists');
        });
      });

    });
  });
}