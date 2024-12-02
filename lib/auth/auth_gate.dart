import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/auth/login_or_register.dart';
import 'package:flutter_project/pages/homepage.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Kiểm tra nếu người dùng đã đăng nhập
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;

            // Nếu user khác null, chuyển đến Homepage
            if (user != null) {
              return const Homepage();
            } else {
              // Nếu user là null, hiển thị LoginOrRegister
              return const LoginOrRegister();
            }
          }

          // Hiển thị màn hình loading khi đang kiểm tra trạng thái
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
