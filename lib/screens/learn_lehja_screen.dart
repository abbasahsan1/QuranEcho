import 'package:flutter/material.dart';
import '../constants/style_constants.dart';

class LearnLehjaScreen extends StatelessWidget {
  const LearnLehjaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Lehja', style: StyleConstants.headlineLarge.copyWith(
          color: Colors.white,
          fontSize: 24,
        )),
        backgroundColor: StyleConstants.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Select Reciter & Surah',
              style: StyleConstants.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            _buildDropdown('Select Reciter', ['Reciter 1', 'Reciter 2', 'Reciter 3']),
            const SizedBox(height: 24),
            _buildDropdown('Select Surah', ['Surah 1', 'Surah 2', 'Surah 3']),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Proceed'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: StyleConstants.bodyLarge),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: StyleConstants.borderRadius,
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              border: InputBorder.none,
            ),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
        ),
      ],
    );
  }
}
