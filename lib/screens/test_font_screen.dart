import 'package:flutter/material.dart';
import '../constants/style_constants.dart';

class TestFontScreen extends StatelessWidget {
  const TestFontScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Font Test')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Headline with PT Serif',
              style: StyleConstants.headlineLarge,
            ),
            const SizedBox(height: 20),
            Text(
              'Body text with PT Serif',
              style: StyleConstants.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
