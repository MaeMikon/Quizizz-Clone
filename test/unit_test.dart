import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/screens/register/register_screen.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';
import 'package:quiz_app/main.dart';

void main() {
  // Main Screen 
  testWidgets("Main screen", (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.text("Quiz App"), findsWidgets);
  });

  testWidgets("Main screen", (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.text("Confirm Password"), findsNothing);
  });

  // Register Screen
  testWidgets("Username is not empty",  (WidgetTester tester) async {
    final username = find.byKey(ValueKey("Username"));
    final createButton = find.byKey(ValueKey("registerButton"));
    
    await tester.pumpWidget(MaterialApp(home: Register_Screen()));
    await tester.enterText(username, "");
    await tester.tap(createButton);
    expect(Register_Screen.errorMessage, "Username is not empty");
  });

  testWidgets("Email is not empty",  (WidgetTester tester) async {
    final username = find.byKey(ValueKey("Username"));
    final email = find.byKey(ValueKey("Email"));
    final createButton = find.byKey(ValueKey("registerButton"));
    
    await tester.pumpWidget(MaterialApp(home: Register_Screen()));
    await tester.enterText(username, "John");
    await tester.enterText(email, "");
    await tester.tap(createButton);
    expect(Register_Screen.errorMessage, "Email is not empty");
  });

  testWidgets("Email is invalid",  (WidgetTester tester) async {
    final username = find.byKey(ValueKey("Username"));
    final email = find.byKey(ValueKey("Email"));
    final createButton = find.byKey(ValueKey("registerButton"));
    
    await tester.pumpWidget(MaterialApp(home: Register_Screen()));
    await tester.enterText(username, "John");
    await tester.enterText(email, "john.test");
    await tester.tap(createButton);
    expect(Register_Screen.errorMessage, "Email is invalid");
  });

  testWidgets("Password is not empty",  (WidgetTester tester) async {
    final username = find.byKey(ValueKey("Username"));
    final email = find.byKey(ValueKey("Email"));
    final password = find.byKey(ValueKey("Password"));
    final createButton = find.byKey(ValueKey("registerButton"));
    
    await tester.pumpWidget(MaterialApp(home: Register_Screen()));
    await tester.enterText(username, "John");
    await tester.enterText(email, "john_test@gmail.com");
    await tester.enterText(password, "");
    await tester.tap(createButton);
    expect(Register_Screen.errorMessage, "Password is not empty");
  });

  testWidgets("Confirm Password is not empty",  (WidgetTester tester) async {
    final username = find.byKey(ValueKey("Username"));
    final email = find.byKey(ValueKey("Email"));
    final password = find.byKey(ValueKey("Password"));
    final confirmPassword = find.byKey(ValueKey("ConfirmPassword"));
    final createButton = find.byKey(ValueKey("registerButton"));
    
    await tester.pumpWidget(MaterialApp(home: Register_Screen()));
    await tester.enterText(username, "John");
    await tester.enterText(email, "john_test@gmail.com");
    await tester.enterText(password, "1234");
    await tester.enterText(confirmPassword, "");
    await tester.tap(createButton);
    expect(Register_Screen.errorMessage, "Confirm Password is not empty");
  });

  testWidgets('Confirm Password do not match',  (WidgetTester tester) async {
    final username = find.byKey(ValueKey("Username"));
    final email = find.byKey(ValueKey("Email"));
    final password = find.byKey(ValueKey("Password"));
    final confirmPassword = find.byKey(ValueKey("ConfirmPassword"));
    final createButton = find.byKey(ValueKey("registerButton"));
    
    await tester.pumpWidget(MaterialApp(home: Register_Screen()));
    await tester.enterText(username, "John");
    await tester.enterText(email, "john_test@gmail.com");
    await tester.enterText(password, "1234");
    await tester.enterText(confirmPassword, "123");
    await tester.tap(createButton);
    expect(Register_Screen.errorMessage, "Confirm Password do not match");
  });

  testWidgets('Everything is ok',  (WidgetTester tester) async {
    final username = find.byKey(ValueKey("Username"));
    final email = find.byKey(ValueKey("Email"));
    final password = find.byKey(ValueKey("Password"));
    final confirmPassword = find.byKey(ValueKey("ConfirmPassword"));
    final createButton = find.byKey(ValueKey("registerButton"));
    
    await tester.pumpWidget(MaterialApp(home: Register_Screen()));
    await tester.enterText(username, "John");
    await tester.enterText(email, "john_test@gmail.com");
    await tester.enterText(password, "1234");
    await tester.enterText(confirmPassword, "1234");
    await tester.tap(createButton);
    expect(Register_Screen.errorMessage, null);
  });

  // Login Screen 
  testWidgets("Login Screen", (WidgetTester tester) async {
    final email = find.byKey(ValueKey("Email"));
    final password = find.byKey(ValueKey("Password"));
    final loginButton = find.byKey(ValueKey("loginButton"));
    
    await tester.pumpWidget(MaterialApp(home: WelcomeScreen()));
    await tester.enterText(email, "john_test@gmail.com");
    await tester.enterText(password, "1234");
    await tester.tap(loginButton);
    expect(WelcomeScreen.errorMessage, "Invalid username or password");
  });
}