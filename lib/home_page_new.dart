import 'package:flutter/material.dart';

class HomePageNew extends StatelessWidget {
  const HomePageNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/bg.jpeg",
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),

                Image.asset(
                  "assets/images/logo.jpeg",
                  height: 120,
                ),

                const SizedBox(height: 10),

                const Text(
                  "BEN AMMAR STORE",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                Expanded(
                  child: GridView.count(
                    padding: const EdgeInsets.all(20),
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: const [
                      _MenuCard("🎮", "Recharge Jeux"),
                      _MenuCard("💳", "Portefeuilles"),
                      _MenuCard("₿", "Cryptomonnaies"),
                      _MenuCard("🎁", "Cartes Cadeaux"),
                      _MenuCard("👔", "Ben Ammar Moule"),
                      _MenuCard("🔧", "Services Divers"),
                      _MenuCard("📱", "Plateformes Pro"),
                      _MenuCard("🎓", "Formations"),
                      _MenuCard("🛍️", "Produits"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final String icon;
  final String title;

  const _MenuCard(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.75),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.amber,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 35),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}