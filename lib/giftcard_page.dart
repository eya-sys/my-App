import 'package:flutter/material.dart';
import 'payment_page.dart';

class GiftCardPage extends StatelessWidget {
  const GiftCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Cartes Cadeaux"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          giftCard(context, "Google Play", "10 USD", "35 DT"),
          giftCard(context, "Google Play", "25 USD", "85 DT"),

          giftCard(context, "Apple Store", "10 USD", "35 DT"),
          giftCard(context, "Apple Store", "25 USD", "85 DT"),

          giftCard(context, "Steam", "10 USD", "35 DT"),
          giftCard(context, "Steam", "20 USD", "68 DT"),

          giftCard(context, "PlayStation", "10 USD", "35 DT"),
          giftCard(context, "PlayStation", "20 USD", "68 DT"),

          giftCard(context, "Xbox", "10 USD", "35 DT"),
          giftCard(context, "Xbox", "20 USD", "68 DT"),
        ],
      ),
    );
  }

  Widget giftCard(
    BuildContext context,
    String card,
    String amount,
    String price,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        title: Text(card),
        subtitle: Text(amount),
        trailing: Text(price),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PaymentPage(
                game: card,
                package: amount,
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