import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meals_app/main.dart';

void main() {
  testWidgets('App renders categories screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: App()));

    expect(find.text('Pick Your Category'), findsOneWidget);
    expect(find.text('Italian'), findsOneWidget);
  });

  testWidgets('Selecting Italian category displays Italian meals', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: App()));

    await tester.tap(find.text('Italian'));
    await tester.pumpAndSettle();

    expect(find.text('Spaghetti Carbonara'), findsOneWidget);
  });

  testWidgets('Open filters screen and verify all four filters exist', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: App()));

    // Open Drawer
    final ScaffoldState scaffoldState = tester.firstState(find.byType(Scaffold));
    scaffoldState.openDrawer();
    await tester.pumpAndSettle();

    // Tap Filters in Drawer
    await tester.tap(find.text('Filters'));
    await tester.pumpAndSettle();

    expect(find.text('Your Filters'), findsOneWidget);
    expect(find.text('Gluten-free'), findsOneWidget);
    expect(find.text('Lactose-free'), findsOneWidget);
    expect(find.text('Vegetarian'), findsOneWidget);
    expect(find.text('Vegan'), findsOneWidget);
  });
}
