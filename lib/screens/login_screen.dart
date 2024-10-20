import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import 'register_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email')),
            TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true),
            SizedBox(height: 16),
            if (isLoading)
              CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
            if (errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text('Belum punya akun? Daftar'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _login() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      await ref
          .read(authProvider.notifier)
          .login(emailController.text, passwordController.text);
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
