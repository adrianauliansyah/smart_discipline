import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:smart_discipline/screens/login_screen.dart';

void main() {
  testWidgets('Halaman login dapat ditampilkan', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    expect(find.text('Welcome Back'), findsOneWidget);
  });
}