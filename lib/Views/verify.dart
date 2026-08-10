import 'package:flutter/material.dart';
import 'package:notes_app/constance/route.dart';
import 'package:notes_app/services/auth/auth_service.dart' show AuthService;

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  bool _sending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Email')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'We\'ve sent you an email verification.\nPlease open it to verify your account.\nIf you haven\'t received a verification email yet, press the button below',
            ),
            const SizedBox(height: 100),
            _sending
                ? const CircularProgressIndicator()
                : TextButton(
                    onPressed: () async {
                      await AuthService.firebase().sendEmailVerification();
                    },
                    child: const Text('Send email verification'),
                  ),
            TextButton(
              onPressed: () async {
                await AuthService.firebase().logOut();
                Navigator.of(
                  context,
                ).pushNamedAndRemoveUntil(registerRoute, (_) => false);
              },
              child: Text('Resart'),
            ),
          ],
        ),
      ),
    );
  }
}
