import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart';


// هذا الكلاس مجرد يرجع حالة توثيق البريد الالكتروني للمستخدم الحالي في التطبيق
@immutable
class AuthUser {
  final bool isEmailVerified;
  const AuthUser(this.isEmailVerified);

  factory AuthUser.fromFirebase(User user) => AuthUser(user.emailVerified);
}
