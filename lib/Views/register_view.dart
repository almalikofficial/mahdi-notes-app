import 'package:flutter/material.dart';
import 'package:notes_app/Utilities/show_error_dialog.dart';

import 'package:notes_app/constance/route.dart';
import 'package:notes_app/services/auth/auth_exceptions.dart';
import 'package:notes_app/services/auth/auth_service.dart' show AuthService;

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late TextEditingController _email;
  late TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: "Enter your email here",
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: "Enter your password here",
            ),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text.trim();
              final password = _password.text;
              try {
                await AuthService.firebase().createUser(
                  email: email,
                  password: password,
                );
                await AuthService.firebase().sendEmailVerification();
                Navigator.of(context).pushNamed(verifyEmailRoute);
              } on WeakPasswordAuthException {
                await showErrorDialog(context, 'weak Password');
              } on EmailAlreadyInUseAuthException {
                await showErrorDialog(context, 'Email Already in Use');
              } on InvalidEmailAuthException {
                await showErrorDialog(context, 'Invalid Email');
              } on GenericAuthException {
                await showErrorDialog(context, 'failed to register');
              }
            },
            child: Text("REGISTER"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil(loginRoute, (_) => false);
            },
            child: const Text('already have an account?'),
          ),
        ],
      ),
    );
  }
}
