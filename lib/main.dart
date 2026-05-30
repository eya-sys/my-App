import 'platforms_page.dart';
import 'formations_page.dart';
import 'products_page.dart';
import 'home_page_new.dart';
import 'package:flutter/material.dart';
import 'payment_page.dart';
import 'recharge_page.dart';
import 'wallet_page.dart';
import 'crypto_page.dart';
import 'giftcard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: 1024 / 1536,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final w = constraints.maxWidth;
              final h = constraints.maxHeight;

              return Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/home_new.jpeg",
                      fit: BoxFit.contain,
                    ),
                  ),

                  // Recharge Jeux
                  Positioned(
                    left: w * (130 / 1024),
                    top: h * (450 / 1536),
                    width: w * (200 / 1024),
                    height: h * (140 / 1536),
                    child: click(
                      context,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RechargePage(),
                          ),
                        );
                      },
                    ),
                  ),

                  // Portefeuilles
                  Positioned(
                    left: w * (390 / 1024),
                    top: h * (450 / 1536),
                    width: w * (200 / 1024),
                    height: h * (140 / 1536),
                    child: click(
                      context,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const WalletPage(),
                          ),
                        );
                      },
                    ),
                  ),

                  // Cryptomonnaies
                  Positioned(
                    left: w * (650 / 1024),
                    top: h * (450 / 1536),
                    width: w * (200 / 1024),
                    height: h * (140 / 1536),
                    child: click(
                      context,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CryptoPage(),
                          ),
                        );
                      },
                    ),
                  ),

                  // Cartes Cadeaux
                  Positioned(
                    left: w * (130 / 1024),
                    top: h * (660 / 1536),
                    width: w * (200 / 1024),
                    height: h * (140 / 1536),
                    child: click(
                      context,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const GiftCardPage(),
                          ),
                        );
                      },
                    ),
                  ),

                  // Ben Ammar Moule
                  Positioned(
                    left: w * (390 / 1024),
                    top: h * (660 / 1536),
                    width: w * (200 / 1024),
                    height: h * (140 / 1536),
                    child: click(
                      context,
                      () => goTo(
                        context,
                        game: "Ben Ammar Moule",
                        package: "Pack Test",
                        price: "10 DT",
                      ),
                    ),
                  ),

                  // Services Divers
                  Positioned(
                    left: w * (650 / 1024),
                    top: h * (660 / 1536),
                    width: w * (200 / 1024),
                    height: h * (140 / 1536),
                    child: click(
                      context,
                      () => goTo(
                        context,
                        game: "Services Divers",
                        package: "Pack Test",
                        price: "10 DT",
                      ),
                    ),
                  ),
                  // Plateformes Pro
Positioned(
  left: w * (130 / 1024),
  top: h * (880 / 1536),
  width: w * (200 / 1024),
  height: h * (140 / 1536),
  child: click(
    context,
    () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const PlatformsPage(),
        ),
      );
    },
  ),
),

// Formations & Coaching
Positioned(
  left: w * (390 / 1024),
  top: h * (880 / 1536),
  width: w * (200 / 1024),
  height: h * (140 / 1536),
  child: click(
    context,
    () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const FormationsPage(),
        ),
      );
    },
  ),
),

// Produits Physiques
Positioned(
  left: w * (650 / 1024),
  top: h * (880 / 1536),
  width: w * (200 / 1024),
  height: h * (140 / 1536),
  child: click(
    context,
    () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const ProductsPage(),
        ),
      );
    },
  ),
),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  static Widget click(BuildContext context, VoidCallback action) {
    return GestureDetector(
      onTap: action,
      child: Container(
        color: Colors.transparent,
      ),
    );
  }

  static void goTo(
    BuildContext context, {
    required String game,
    required String package,
    required String price,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PaymentPage(
          game: game,
          package: package,
          price: price,
          playerId: "",
        ),
      ),
    );
  }
}