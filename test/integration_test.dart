
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/register/register_screen.dart';

void main() {
  testWidgets('Test Screen', (WidgetTester tester) async {
    //find Widget
      final username = find.byKey(ValueKey("Username"));
      final password = find.byKey(ValueKey("Password"));
      final email = find.byKey(ValueKey("Email"));
      final confirmPassword = find.byKey(ValueKey("ConfirmPassword"));
      final createButton = find.byKey(ValueKey("registerButton"));
    //excecute Test
      await tester.pumpWidget(MaterialApp(home: Register_Screen()));
      await tester.enterText(username, "Linh");
      await tester.enterText(email, "Linh@gmail.com");
      await tester.enterText(password, "541999");
      await tester.enterText(confirmPassword, "541999");
      await tester.tap(createButton);
      
    //expectedOutput
      expect(Register_Screen.registerResult, true);
  });

  testWidgets('Question Screen', (WidgetTester tester) async {
    //find Widget
      final answer = find.byKey(ValueKey("Answer1"));

    //excecute Test
      await tester.pumpWidget(MaterialApp(home: Question()));
      await tester.tap(answer);
      
    //expectedOutput
      expect(Question.correct_answer, true);
  });
}