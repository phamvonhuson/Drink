import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/main.dart';
import 'package:flutter_project/auth/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_project/firebase_options.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  testWidgets('MainApp displays AuthGate initially',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MainApp());

    expect(find.byType(AuthGate), findsOneWidget);

    // Kiểm tra nếu widget LoginOrRegister có chứa nút "Login"
    // Đây là phần bạn có thể kiểm tra trong trường hợp AuthGate đang hiển thị LoginOrRegister
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
  });
}
