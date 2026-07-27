import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as devtools show log;

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
            const Text('Please verify your email'),
            const SizedBox(height: 12),
            _sending
                ? const CircularProgressIndicator()
                : TextButton(
                    onPressed: () async {
                      setState(() => _sending = true);
                      try {
                        final user = FirebaseAuth.instance.currentUser;
                        if (user != null && !user.emailVerified) {
                          await user.sendEmailVerification();
                        }
                      } on FirebaseAuthException catch (e) {
                        // ignore: avoid_print
                        devtools.log(e.code);
                      } finally {
                        if (mounted) setState(() => _sending = false);
                      }
                    },
                    child: const Text('Send email verification'),
                  ),
          ],
        ),
      ),
    );
  }
}