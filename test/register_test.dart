mport 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


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
      await tester.pumpWidget(MaterialApp(home: Register_Screen(),));
      await tester.enterText(username, "Linh");
      await tester.enterText(email, "Linh@gmail.com");
      await tester.enterText(password, "541999");
      await tester.enterText(confirmPassword, "5419flu99");
      await tester.tap(createButton);
    //expectedOutput
      expect(Register_Screen.register_result,true);

  });
}