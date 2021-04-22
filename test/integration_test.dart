import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/screens/register/register_screen.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';
import 'package:quiz_app/main.dart' as app;

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

  group('Quizz App',(){
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    // Register và Login
    testWidgets("Register and Login ", (tester) async {
      app.main();
      await tester.pumpAndSettle();
      //Login finder
      final loginEmail = find.byKey(ValueKey("loginEmail"));
      final loginPassword = find.byKey(ValueKey("loginPassword"));
      final loginButton = find.byKey(ValueKey("loginButton"));
      final gotoRegister = find.byKey(ValueKey("Go to Register"));
      //Register finder
      final username = find.byKey(ValueKey("Username"));
      final email = find.byKey(ValueKey("Email"));
      final password = find.byKey(ValueKey("Password"));
      final confirmPassword = find.byKey(ValueKey("ConfirmPassword"));
      final createButton = find.byKey(ValueKey("registerButton"));
      //Tap go to Register button
      await tester.tap(gotoRegister);
      await tester.pumpAndSettle();
      // Nhập dữ liệu đăng ký
      await tester.enterText(username, "Mikon");
      await tester.enterText(email, "Mikon@gmail.com");
      await tester.enterText(password, "Mikon");
      await tester.enterText(confirmPassword, "Mikon");
      await tester.pumpAndSettle();
      await tester.tap(createButton);
      await tester.pumpAndSettle();
      //Nhập dữ liệu đă đăng ký để đăng nhập
      await tester.enterText(loginEmail, "Mikon@gmail.com");
      await tester.enterText(loginPassword, "Mikon1");
      await tester.pumpAndSettle();
      await tester.tap(loginButton);
      await tester.pumpAndSettle();
      //Expected
      expect(WelcomeScreen.errorMessage, "Invalid username or password");
    });
  });
}