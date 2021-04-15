import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/screens/register/register_screen.dart';

void main(){

  testWidgets("find Create Account", (WidgetTester tester) async {
      await tester.pumpWidget(Register_Screen());
      //Verify that input field has correct placeholder
      expect(find.text("Create Account"), findsOneWidget);
  });
}