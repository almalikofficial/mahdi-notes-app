import 'package:flutter_test/flutter_test.dart';
import 'package:notes_app/Views/login_view.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const LoginView());

    expect(find.byType(LoginView), findsOneWidget);
  });
}
