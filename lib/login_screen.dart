import 'package:flutter/material.dart';
import 'main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String userEmail = "username@admin.com";
  String userPassword = "123456";
  String notification = " ";

  void login(String email, String password) {
    if (email == userEmail && password == userPassword) {
      setState(() {
        notification = " ";
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TemperatureConverterScreen()),
      );
    } else {
      setState(() {
        notification = "Email atau password salah";
      });
    }
  }

  String? validateEmail(String? value) {
    const pattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\$";
    final regex = RegExp(pattern);
    return value == null || value.isEmpty || !regex.hasMatch(value) ? 'Masukkan email yang valid' : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => login(emailController.text, passwordController.text),
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            Text(
              notification,
              style: const TextStyle(color: Colors.red, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
