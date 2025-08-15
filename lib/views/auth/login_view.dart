import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/router/app_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _loading = false;

  Future<void> _submit() async {
    final auth = context.read<AuthController>();
    setState(() => _loading = true);
    try {
      await auth.login(email: _email.text, password: _password.text);
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed(AppRoutes.shell);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'you@example.com',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _password,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: '••••••••',
              ),
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              label: _loading ? 'Please wait…' : 'Continue',
              icon: Icons.login,
              expanded: true,
              onPressed: _loading ? null : _submit,
            ),
          ],
        ),
      ),
    );
  }
}
