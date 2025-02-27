import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🌟 Background Image
          Positioned.fill(
            child: Image.network(
              'https://wallpaperaccess.com/full/170249.jpg', // Islamic theme
              fit: BoxFit.cover,
            ),
          ),

          // 🌟 Semi-transparent Overlay for readability
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),

          // 🌟 Main Content
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🕌 Title
                const Text(
                  "QURAN ECHO",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                    fontFamily: 'Serif',
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // 📌 Buttons as Cards with Icons & Navigation
                _buildCard(
                  context,
                  "HIFZ",
                  "https://www.arabiantongue.com/wp-content/uploads/2022/12/Hifz-program-for-adults.jpg",
                  Icons.menu_book_rounded,
                  Colors.orangeAccent,
                  "/hifz",
                ),
                _buildCard(
                  context,
                  "LEARN LEHJA",
                  "https://i.pinimg.com/736x/79/db/58/79db588f4e9a082e63ebde7245e16be7.jpg",
                  Icons.record_voice_over,
                  Colors.blueAccent,
                  "/selectQari",
                ),
                _buildCard(
                  context,
                  "MAKHARAJ",
                  "https://i.ytimg.com/vi/Z7oy4rppmAk/hqdefault.jpg",
                  Icons.mic,
                  Colors.greenAccent,
                  "/makharij",
                ),
                _buildCard(
                  context,
                  "DASHBOARD",
                  "https://cdn-icons-png.freepik.com/256/16139/16139673.png?semt=ais_hybrid",
                  Icons.dashboard,
                  Colors.purpleAccent,
                  "/dashboard",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔥 Card Builder Function
  Widget _buildCard(BuildContext context, String title, String imageUrl,
      IconData icon, Color color, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Card(
        color: Colors.white.withOpacity(0.9),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              // 🖼️ Image Icon
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),

              // 📜 Title & Icon
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              Icon(icon, color: color, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}