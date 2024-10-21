import 'package:flutter/material.dart';

class LoginSuccessScreen extends StatelessWidget {
  final String name;
  final String email;

  const LoginSuccessScreen({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name 님 환영'),
      ),
      body: Center(
        child: Text('$email 님 환영'),
      ),
    );
  }
}
