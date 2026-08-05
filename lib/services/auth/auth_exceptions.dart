// الخطوة الأولى
// تعريف الاستثناءات الخاصة بالمصادقة
//تفيد هذه الاستثناءات في التعامل مع الأخطاء التي قد تحدث أثناء عمليات تسجيل الدخول والتسجيل في التطبيق.
// اسم الكلاس يمثل ذات المشكلة التي يرمز لها ومن خلال انه يعتمد على التنفيذ مثل اكسبشن فهو يمثل المشكلة ذاتها
// login exceptions
class InvalidCredentialsAuthException implements Exception {}

// registration exceptions
class EmailAlreadyInUseAuthException implements Exception {}

class WeakPasswordAuthException implements Exception {}

class InvalidEmailAuthException implements Exception {}

// generic exceptions
class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}
