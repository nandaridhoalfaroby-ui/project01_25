import 'package:flutter_test/flutter_test.dart';
import 'package:latihan01_25/main.dart';

void main() {
  testWidgets('MyApp builds successfully', (WidgetTester tester) async {
    await tester.pumpWidget(
      MyApp(
        buku: Barang('Test Buku', 0, 0, ''),
        permintaan: 1,
      ),
    );

    expect(find.byType(MyApp), findsOneWidget);
  });
}