import 'package:notes_app/services/auth/auth_user.dart';

// كلاس يستخدم فقط من اجل ذاته ولا يمكن جلب كائنات منه
// هذا الكلاس يفرض وجود هذه الدوال على اي كلاس يرث منه
abstract class AuthProvider {
  //اخذ المستخدم الحالي
  AuthUser? get currentUser;
  // تسجيل الدخول يتطلب بريد وكلة مرور ترجعها الدالة على شكل فيوجر
  Future<AuthUser> logIn({
    required String email,
    required String password,
  });
  // انشاء مستخدم جديد يتطلب بريد وكلمة مرور ترجعها الدالة على شكل فيوجر
  Future<AuthUser> createUser({
    required String email,
    required String password,
  });
  // تسجيل الخروج من التطبيق
  Future<void> logOut();
  // ارسال رسالة تحقق على البريد الالكتروني
  Future<void> sendEmailVerification();
}
