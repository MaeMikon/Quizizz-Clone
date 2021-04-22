// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:quiz_app/main.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';

void main() {
  testWidgets('Login screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('Quiz App'), findsWidgets);
   
  });
  // testWidgets('Enter email', (WidgetTester tester) async {
  //   await tester.pumpWidget(MyApp());
  //   await tester.enterText(find.byType(TextField), 'hhieubk99@gmail.com');
  //   expect(find.text('hhieubk99@gamil.com'), findsOneWidget);
  // } );
}
