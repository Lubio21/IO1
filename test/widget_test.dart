import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hello_word/main.dart';

void main() {
  testWidgets('tlačidlo hodí kockou a zobrazí lokálny obrázok', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Padla strana: 1'), findsOneWidget);
    expect(
      tester.widget<Image>(find.byType(Image)).image,
      isA<AssetImage>().having(
        (AssetImage image) => image.assetName,
        'cesta k obrázku',
        'assets/Images/dice-1.png',
      ),
    );

    await tester.tap(find.text('Hodiť kockou'));
    await tester.pump();

    final resultText = tester.widget<Text>(
      find.byWidgetPredicate(
        (widget) => widget is Text && widget.data!.startsWith('Padla strana: '),
      ),
    );
    final diceValue = int.parse(resultText.data!.split(': ').last);

    expect(diceValue, inInclusiveRange(1, 6));
    expect(
      tester.widget<Image>(find.byType(Image)).image,
      isA<AssetImage>().having(
        (AssetImage image) => image.assetName,
        'cesta k obrázku',
        'assets/Images/dice-$diceValue.png',
      ),
    );
  });
}
