import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as devtools show log;

import 'package:notes_app/constance/route.dart';

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
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
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
