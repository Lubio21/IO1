import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hod kockou',
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const KockaPage(),
    );
  }
}

class KockaPage extends StatefulWidget {
  const KockaPage({super.key});

  @override
  State<KockaPage> createState() => _KockaPageState();
}

class _KockaPageState extends State<KockaPage> {
  final Random _random = Random();
  int _kockaValue = 1;

  void _rollDice() {
    // setState prekreslí obrazovku s novou náhodnou stranou kocky.
    setState(() {
      _kockaValue = _random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hod kockou')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Číslo určuje, ktorý lokálny obrázok kocky sa zobrazí.
            Image.asset(
              'assets/Images/dice-$_kockaValue.png',
              width: 180,
              height: 180,
            ),
            const SizedBox(height: 24),
            Text(
              'Padla strana: $_kockaValue',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _rollDice,
              child: const Text('Hodiť kockou'),
            ),
          ],
        ),
      ),
    );
  }
}
