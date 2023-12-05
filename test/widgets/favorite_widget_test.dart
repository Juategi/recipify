import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipy/common/dependency_injection.dart';
import 'package:recipy/view/providers/favorites_provider.dart';
import 'package:recipy/view/widgets/favorite_widget.dart';

void main() {
  const id = '1';
  setUpAll(() => DependendyInjection.setUp());
  testWidgets('FavoriteWidget displays red icon color',
      (WidgetTester tester) async {
    final favoritesProvider = ProviderContainer();
    favoritesProvider.read(asyncFavoritesProvider.notifier).toggleFavorite(id);
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: SizedBox(
              child: FavoriteWidget(id: id),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    final iconFinder = find.byIcon(Icons.favorite, skipOffstage: false);
    expect(iconFinder, findsOneWidget);
    final iconWidget = tester.widget<Icon>(iconFinder);
    expect(iconWidget.color, Colors.red);
  });

  testWidgets('FavoriteWidget displays grey icon color',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: SizedBox(
              child: FavoriteWidget(id: id),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    final iconFinder = find.byIcon(Icons.favorite, skipOffstage: false);
    expect(iconFinder, findsOneWidget);
    final iconWidget = tester.widget<Icon>(iconFinder);
    expect(iconWidget.color, Colors.grey);
  });
}
