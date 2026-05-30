import 'package:flutter/material.dart';
import 'payment_page.dart';

class RechargePage extends StatelessWidget {
  const RechargePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Recharge Jeux"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          gameCard(
            context,
            "Free Fire",
            "100 Diamonds",
            "5 DT",
          ),
          gameCard(
            context,
            "Free Fire",
            "310 Diamonds",
            "12 DT",
          ),
          gameCard(
            context,
            "PUBG",
            "60 UC",
            "4 DT",
          ),
          gameCard(
            context,
            "PUBG",
            "325 UC",
            "18 DT",
          ),
          gameCard(
            context,
            "Valorant",
            "475 VP",
            "8 DT",
          ),
        ],
      ),
    );
  }

  Widget gameCard(
    BuildContext context,
    String game,
    String pack,
    String price,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        title: Text(game),
        subtitle: Text(pack),
        trailing: Text(price),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PaymentPage(
                game: game,
                package: pack,
                price: price,
                playerId: "",
              ),
            ),
          );
        },
      ),
    );
  }
}