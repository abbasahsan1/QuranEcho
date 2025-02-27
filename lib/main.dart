import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/Signup.dart';
import 'screens/hifz_screen.dart';
import 'screens/learn_lehja_screen.dart';
import 'theme/app_theme.dart';
import 'constants/style_constants.dart';  // Add this import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quran Echo',
      theme: AppTheme.theme,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/homepage': (context) => const HomeScreen(),
        '/hifz': (context) => const HifzScreen(),
        '/learn_lehja': (context) => const LearnLehjaScreen(),
      },
    );
  }
}

// Update HomeScreen to include navigation to new screens
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quran Echo",
          style: StyleConstants.headlineLarge.copyWith(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        backgroundColor: StyleConstants.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildMenuCard(context, 'Hifz', Icons.book, '/hifz'),
            _buildMenuCard(context, 'Learn Lehja', Icons.record_voice_over, '/learn_lehja'),
            _buildMenuCard(context, 'Makharaj', Icons.language, '/makharaj'),
            _buildMenuCard(context, 'Dashboard', Icons.dashboard, '/dashboard'),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, IconData icon, String route) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: StyleConstants.borderRadius),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: StyleConstants.primaryColor),
            const SizedBox(height: 16),
            Text(title, style: StyleConstants.bodyLarge),
          ],
        ),
      ),
    );
  }
}