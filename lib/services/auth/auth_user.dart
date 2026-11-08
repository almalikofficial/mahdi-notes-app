import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart';

// هذا الكلاس مجرد يرجع حالة توثيق البريد الالكتروني للمستخدم الحالي في التطبيق
@immutable
class AuthUser {
  final String id;
  final String email;
  final bool isEmailVerified;
  const AuthUser({
    required this.isEmailVerified,
    required this.email,
    required this.id,
  });

  factory AuthUser.fromFirebase(User user) => AuthUser(
    id: user.uid,
    email: user.email!,
    isEmailVerified: user.emailVerified,
  );
}
