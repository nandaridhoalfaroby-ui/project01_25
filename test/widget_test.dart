import 'package:flutter_test/flutter_test.dart';
import 'package:latihan01_25/main.dart';

void main() {
  testWidgets('MyApp builds successfully', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MyApp(daftarBarang: []),
    );

    expect(find.byType(MyApp), findsOneWidget);
  });
}