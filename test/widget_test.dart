import 'package:flutter_test/flutter_test.dart';
import 'package:tu_solution/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('La aplicación muestra el nombre del taller', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: TuSolutionApp()));
    await tester.pump();
    expect(find.text('Tu Solution'), findsOneWidget);
  });
}
