import 'package:flutter/material.dart';
import 'payment_page.dart';

class PlatformsPage extends StatelessWidget {
  const PlatformsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Plateformes Pro"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          item(context, "Canva Pro", "1 Mois", "15 DT"),
          item(context, "ChatGPT Plus", "1 Mois", "75 DT"),
          item(context, "Netflix Premium", "1 Mois", "20 DT"),
          item(context, "Spotify Premium", "1 Mois", "12 DT"),
          item(context, "YouTube Premium", "1 Mois", "15 DT"),
          item(context, "CapCut Pro", "1 Mois", "18 DT"),
        ],
      ),
    );
  }

  Widget item(
      BuildContext context, String name, String pack, String price) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text(pack),
        trailing: Text(price),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PaymentPage(
                game: name,
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