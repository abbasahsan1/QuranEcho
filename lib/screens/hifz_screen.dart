import 'package:flutter/material.dart';
import '../constants/style_constants.dart';

class HifzScreen extends StatelessWidget {
  const HifzScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hifz', style: StyleConstants.headlineLarge.copyWith(
          color: Colors.white,
          fontSize: 24,
        )),
        backgroundColor: StyleConstants.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Select Your Daily Goal',
              style: StyleConstants.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            _buildTimeOption('5 min / day'),
            _buildTimeOption('15 min / day', isSelected: true),
            _buildTimeOption('30 min / day'),
            _buildTimeOption('45 min / day'),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeOption(String text, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? StyleConstants.accentColor.withOpacity(0.1) : Colors.white,
        borderRadius: StyleConstants.borderRadius,
        border: Border.all(
          color: isSelected ? StyleConstants.accentColor : Colors.grey.shade300,
        ),
      ),
      child: ListTile(
        title: Text(text, style: StyleConstants.bodyLarge),
        trailing: isSelected ? const Icon(Icons.check_circle, color: StyleConstants.accentColor) : null,
      ),
    );
  }
}
