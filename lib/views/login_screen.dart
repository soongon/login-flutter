import 'package:flutter/material.dart';

import 'login_success_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  bool loggedIn = false;
  String name = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: _buildLoginForm()
        ),
      ),
    );
  }
  
  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _validate() {
    final form = _formKey.currentState;

    if (form?.validate() == false) {
      return;
    }

    final name = _nameController.text;
    final email = _emailController.text;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => LoginSuccessScreen(name: name, email: email)
      )
    );

    // pushReplacement 함수는 현재 화면을 새로운 화면으로 대체 (로그인 화면으로 돌아가기 불가)
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (_) => LoginSuccessScreen(name: name, email: email)
    //   )
    // );

  }
  
  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: '이름'),
            validator: (text) => 
              text!.isEmpty ? '이름을 입력해 주세요' : null,
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: '이메일'),
            validator: (text) {
              if (text!.isEmpty) {
                return '이메일을 입력해 주세요';
              }
              final regex = RegExp('[^@]+@[^.]+..+');
              if (!regex.hasMatch(text)) {
                return '유효한 이메일을 입력해 주세요';
              }
              return null;
            },
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: _validate,
            child: Text('로그인'),
          )
        ],
      ),
      
    );
  }
}


