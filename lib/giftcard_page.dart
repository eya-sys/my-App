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
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
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
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.amber,
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withOpacity(0.15),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        leading:  CircleAvatar(
          backgroundColor: Colors.amber,
          child: Text(
             card.substring(0, 1),
    style: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
        ),
        title: Text(
          card,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          amount,
          style: const TextStyle(
            color: Colors.white70,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            price,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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